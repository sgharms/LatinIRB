#!/usr/bin/env ruby

require 'irb'
require 'irb/completion'
require 'latinverb'
require 'latinirb/paradigmatic_verbs'
require 'macronconversions'
require 'pp'

# Monkey-patch to change the gets behavior.  In the gem, the FileInputMethod
# class's 'gets' method always prints out what was read.  This should be
# suppressed by the IRB class's Context class's ECHO state, but this is not
# used, possibly a bug depending on what the semantics of that @echo variable
# are meant to mean.

module IRB
  class FileInputMethod < InputMethod
    def gets
      @io.gets
    end
  end
end

module Linguistics
  module Latin
    module Util
      class LatinIRB
        def self.begin
          #---
          #
          # This method is taken from irb.rb's IRB.start method.  I trimmed
          # out some of the conditional possibilities that I did not want to
          # handle here (because they're not necessary).
          #
          # Run the basic setup script and pull the configuration object
          # (IRB::Context) back into the present scope.  Then we set that
          # object's options and proceed.
          #
          #+++
          
          IRB.setup(nil)
          @CONF = IRB.conf

          # This will be the script IRB sources on execution. You can
          # pre-define variables (@aFirst, etc.) and convenience methods here.

          @CONF[:SCRIPT]=File.join(File.dirname(__FILE__),  %w|latirb.rb|)

          # No, do not tell me what you read in
          @CONF[:ECHO]=false

          # Nor tell me how it evaluated
          @CONF[:VERBOSE]=false

          # We need this module
          @CONF[:LOAD_MODULES]=["latinverb"]

          # Create an irb object that is programmed to (silently, per above)
          # source a configuration file that ends with a call to 'irb' itself
          # after defining several instance variables
          
          irb = IRB::Irb.new(nil, @CONF[:SCRIPT])

          # Create a LatinIRB prompt
          @CONF[:PROMPT][:LATINIRB] = {
                                        :PROMPT_I    => "LatinIRB > ", 
                                        :PROMPT_S    => "LatinIRB%l> ",
                                        :PROMPT_C    => "LatinIRB > ", 
                                        :PROMPT_N    => "LatinIRB ?> ",
                                        :RETURN      => " => %s \n",
                                        :AUTO_INDENT => true
                                      }
          @CONF[:PROMPT_MODE]=:LATINIRB

          # Unless this is set, eval_input will fail.  Make sure this is
          # set.
          @CONF[:MAIN_CONTEXT] = irb.context

          # This corrects the tab-completion behavior as provided by
          # irb/completion.rb.  In the even that what's tabbed-after matches
          # the RegExp, it should invoke this process.  If the receiver is a
          # LatinVerb, the full complement of vectors should be provided as
          # complet-able.  IF NOT, then the pairing is passed to the standard
          # CompletionProc.
          
          Readline.completion_proc = calculate_completion_proc

          # We have finished the configuration at this point, so now we need
          # to kick up the REPL after providing preliminary instruction.
          puts "Beginning a LatinVerb session."

          puts "The following verbs have been made available to this session via latirb.rb:"

          instance_variables.grep(/[a-z]/).each{|x| puts "  * #{x}"}

          puts "Tab-completion of the conjugation \"vectors\" is supported."

          trap("SIGINT") do
            irb.signal_handle
          end

          begin
            catch(:IRB_EXIT) do
              # Start the REPL
              irb.eval_input
            end
          end

          puts "Vale!  Come back to LatinIRB soon."
        end

        ##
        #
        # Used to override IRB::InputCompletor::select_message for handling
        # tab-completion of instance variables.  Code is largely taken from
        # that method with the addition of the /^@/ condition.  In
        # IRB::Completor, when an array of matches has been identified, they
        # are sent as the "candidates" while the "receiver" bears the match
        # based on the regex of "message."
        #
        ##
        
        def self.select_message(receiver, message, candidates)
          candidates.grep(/^#{message}/).collect do |e|
            case e
              when /^[a-zA-Z_]/
                receiver + "." + e
              when /^[0-9]/
              when /^@/
                e
              when *Operators
                #receiver + " " + e
            end
          end
        end

        ##
        #
        # As part of the TAB completion, Readline must be provided a
        # completion proc that will be used to generate the matching results
        # that will be appended to the line at whose end the TAB key was
        # struck.  This method provides that proc.
        #
        ##

        def self.calculate_completion_proc
          proc do |input| 
            bind = IRB.conf[:MAIN_CONTEXT].workspace.binding

            input =~ /^([^."].*)\.([^.]*)$/
            begin
              receiver = $1
              message = Regexp.quote($2)
              rObj = instance_variable_get(receiver.to_sym)
            rescue Exception
            end

            if rObj.class == Linguistics::Latin::Verb::LatinVerb
              IRB::InputCompletor::select_message(receiver, message, rObj.instance_methods.grep(/^#{message}/))
            elsif input =~ /^@/
              # This handles instance variables.  input is @someInstanceVariable's @aSomeIn<TAB>
              self.select_message(input, input, eval("instance_variables", bind).grep(/^@a/))
            else
              IRB::InputCompletor::CompletionProc.call input
            end
          end
        end

      end
    end
  end
end

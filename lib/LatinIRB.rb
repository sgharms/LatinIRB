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
# are meant to mean


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
          puts "Beginning a LatinVerb session."
          puts "The following verbs have been made available to this session via latirb.rb:"

          instance_variables.each{|x| puts "  * #{x}"}

          puts "Tab-completion of the conjugation \"vectors\" is supported."

          # Pretend to tell IRB to parse the options from the command line
          # Put this one first.  This will be the script IRB sources on
          # execution
          ARGV.unshift "lib/latirb.rb"
          
          # No, do not tell me what  you read in
          ARGV.unshift "--noecho"
          # Nor tell me how it evaluated
          ARGV.unshift "--noverbose"

          # Let's make sure we're using Unicode
          ARGV.unshift "-U"

          # Include the LatinVerb library so that you can play with the variables
          ARGV.unshift "-rlatinverb"
          
          # Taken from irb.rb's IRB.start method.  I trimmed out some of the
          # conditional possibilities that I did not want to handle here
          # (because they're not necessary).
          
          # Run the basic setup script and pull the configuration object back
          # into the present scope
          IRB.setup(nil)
          @CONF = IRB.conf

          # Create an irb object that is programmed to (silently, per above)
          # source a configuration file that ends with a call to 'irb' itself
          # after defining several instance variables
          
          irb = IRB::Irb.new(nil, @CONF[:SCRIPT])

          # Create a LatinIRB prompt
          @CONF[:PROMPT][:LATINIRB] = {
                                        :PROMPT_I=>"LatinIRB > ", 
                                        :PROMPT_S=>"LatinIRB%l> ",
                                        :PROMPT_C=>"LatinIRB > ", 
                                        :PROMPT_N=>"LatinIRB ?> ",
                                        :RETURN=>" => %s \n",
                                        :AUTO_INDENT=>true
                                      }
          @CONF[:PROMPT_MODE]=:LATINIRB

          @CONF[:MAIN_CONTEXT] = irb.context

          trap("SIGINT") do
            irb.signal_handle
          end

          begin
            catch(:IRB_EXIT) do
              # Start the REPL
              irb.eval_input
            end
          end

          puts "Salve!  Come back to LatinIRB soon."
        end
      end
    end
  end
end

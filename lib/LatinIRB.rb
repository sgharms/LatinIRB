#!/usr/bin/env ruby

require 'irb'
require 'irb/completion'
require 'latinverb'

module Linguistics
  module Latin
    module Util
      class LatinIRB
        def self.begin
          configure_irb_singleton
          @irb = get_irb_singleton
          set_required_main_irb_context
          configure_latinverb_prompt
          print_prelude

          trap("SIGINT") do
            irb.signal_handle
          end

          begin
            catch(:IRB_EXIT) do
              # Start the REPL
              @irb.eval_input
            end
          end

          puts "Vale!  Come back to LatinIRB soon."
        end

        def self.configure_latinverb_prompt
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
        end

        def self.configure_irb_singleton
          IRB.setup(nil)
          @CONF = IRB.conf

          # This will be the script IRB sources on execution. You can
          # pre-define variables (@aFirst, etc.) and convenience methods here.

          @CONF[:SCRIPT]=File.join(File.dirname(__FILE__),  %w|latirb.rb|)

          # No, do not tell me what you read in
          @CONF[:ECHO]=false

          # Nor tell me how it evaluated
          @CONF[:VERBOSE]=false
        end

        def self.get_irb_singleton
          # Create an irb object that is programmed to source a configuration
          # file that ends with a call to 'irb' itself after defining several
          # instance variables

          @CONF[:LOAD_MODULES]=["latinverb"]
          IRB::Irb.new(nil, @CONF[:SCRIPT])
        end

        def self.print_prelude
          puts "Beginning a LatinVerb session."
          puts "The following verbs have been made available to this session:"
          self.irb_ivars.each{|x| puts "  * #{x}"}
          puts "Tab-completion of the conjugation \"vectors\" is supported."
          puts ""
        end

        def self.irb_ivars
          File::open(@irb.context.io.file_name).readlines.grep(/^@/).map do |x|
            x.sub(/(@\w+)\s.*\n/, "\\1")
          end
        end

        def self.set_required_main_irb_context
          # Unless this is set, eval_input will fail.
          @CONF[:MAIN_CONTEXT] = @irb.context
        end

      end
    end
  end
end

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
# used, probably a bug.
#
#
module IRB
  class FileInputMethod < InputMethod
    def gets
      @io.gets
    end
  end

  class StdioOutputMethod<OutputMethod
    def printf(format, *opts)
      raise "zabu"
    end
    def puts(format, *opts)
      raise "zabu"
    end
    def print(*opts)
      STDOUT.print(*opts)
    end
  end

end

module Linguistics
  module Latin
    module Util
      class LatinIRB
        def self.begin
          puts "Beginning a LatinVerb session..."
          puts"Check presence of p'dgm verb: #{@aFirst}\n\n"
          #debugger

          # Pretend to ell IRB to parse the options from the command line

# Put this one first
ARGV.unshift "latirb.rb"


ARGV.unshift "-U"
ARGV.unshift "-r latinverb"
ARGV.unshift "--noecho"

IRB::start
        end
      end
    end
  end
end

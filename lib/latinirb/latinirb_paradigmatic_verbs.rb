# Popular Irregulars
TO_BE     = Linguistics::Latin::Verb::LatinVerb.new %q(sum esse fuī futūrus)
TO_CARRY  = Linguistics::Latin::Verb::LatinVerb.new %q(ferō ferre tulī lātum)
TO_COME   = Linguistics::Latin::Verb::LatinVerb.new %q(eō īre ivī itum)

AFIRST_ASCII_STRING = 'am\={o}, am\={a}re, am\={a}v\={\i}, amatum'
AFIRST_STRING = Text::Latex::Util::Macronconversions.convert(AFIRST_ASCII_STRING, 'mc')

def j
  puts AFIRST.active_voice_indicative_mood_present_tense_first_person_singular_number
end

def b(f)
  puts f.active_voice_indicative_mood_present_tense_first_person_singular_number
end

module Kernel
  LatinVerb = Linguistics::Latin::Verb::LatinVerb

  def chart(latin_verb=nil)
    puts "USAGE: chart (a_latin_verb|latin_verb_string)" if latin_verb.nil?
    verb = is_latinverb?(latin_verb) ? latin_verb : verb_for_string(latin_verb)
    puts Linguistics::Latin::Verb::LatinVerb::ChartPresenter.new(verb).chart
  end

  def is_latinverb?(possible_latin_verb)
    possible_latin_verb.methods.any?{|m| m.match(/.*voice.*mood.*tense/)}
  end

  def verb_for_string(verb_string)
    macronized_string = Text::Latex::Util::Macronconversions.convert(verb_string, 'mc').gsub(',', '')
    Linguistics::Latin::Verb::LatinVerb.new(macronized_string)
  end
end

# Start up the REPL
irb

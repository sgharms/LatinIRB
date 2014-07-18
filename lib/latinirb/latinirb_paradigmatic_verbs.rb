# Popular Irregulars
TO_BE     = Linguistics::Latin::Verb::LatinVerb.new %q(sum esse fuī futūrus)
TO_CARRY  = Linguistics::Latin::Verb::LatinVerb.new %q(ferō ferre tulī lātum)
TO_COME   = Linguistics::Latin::Verb::LatinVerb.new %q(eō īre ivī itum)

def j
  puts @aFirst.active_voice_indicative_mood_present_tense_first_person_singular_number
end

def b(f)
  puts f.active_voice_indicative_mood_present_tense_first_person_singular_number
end

Kernel.class_eval do
  def chart(latin_verb)
  end
end

# Start up the REPL
irb

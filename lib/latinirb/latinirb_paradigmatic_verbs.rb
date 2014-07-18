# Basic definitions

A_FIRST   = Linguistics::Latin::Verb::LatinVerb.new %q(amō   amāre  amāvī  amatum)
A_SECOND  = Linguistics::Latin::Verb::LatinVerb.new %q(moneō monēre monvī  monitum)
A_THIRD   = Linguistics::Latin::Verb::LatinVerb.new %q(agō   agere  ēgī    actum)
A_THIRDIO = Linguistics::Latin::Verb::LatinVerb.new %q(capiō capere cēpī   captum)
A_FOURTH  = Linguistics::Latin::Verb::LatinVerb.new %q(audiō audīre audīvī auditum)

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

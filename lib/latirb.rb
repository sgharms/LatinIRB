# Basic definitions
@aFirst   = Linguistics::Latin::Verb::LatinVerb.new %q(amō   amāre  amāvī  amatum)
@aSecond  = Linguistics::Latin::Verb::LatinVerb.new %q(moneō monēre monvī  monitum)
@aThird   = Linguistics::Latin::Verb::LatinVerb.new %q(agō   agere  ēgī    actum)
@aThirdIO = Linguistics::Latin::Verb::LatinVerb.new %q(capiō capere cēpī   captum)
@aFourth  = Linguistics::Latin::Verb::LatinVerb.new %q(audiō audīre audīvī auditum)

# Popular Irregulars
@toBe     = Linguistics::Latin::Verb::LatinVerb.new %q(sum esse fuī futūrus)
@toCarry  = Linguistics::Latin::Verb::LatinVerb.new %q(ferō ferre tulī lātum)
@toCome   = Linguistics::Latin::Verb::LatinVerb.new %q(eō īre ivī itum)

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

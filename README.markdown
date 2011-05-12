# LatinIRB

## DESCRIPTION

LatinIRB is an IRB session in which a user can interact with paradigmatic
Latin verbs (`@aFirst`, `@aSecond`, `@aThird`, `@aThirdIO`, `@aFourth`).  By
launching IRB, one may call methods on these objects  ).  By launching IRB,
one may call methods on these objects.  The methods of chief interest will be
those that are _vectors_ within the LatinVerb parlance i.e. methods that
uniquely identify a specific conjugated form of a verb.

  An primary use case would be:
  
  @aFirst.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number #=> amō

## INSTANTIATING

Because LatinVerb attempts to preserve the phonographic data of a Latin verb,
the quantity of the vowels, the LatinVerb-definining string _must_ contain the
macron data so that the heuristics work.  To this end, you may use
MacronConversions to convert ASCII TeX-style transliterations of macronized
vowels to produce the correct string:

lv = LatinVerb.new(MacronConversions::convert 'am\={o} am\={a}re am\={a}v\={i} amatum')
lv.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number #=> amō


## AUTHOR

Steven G. Harms (http://stevengharms.com)


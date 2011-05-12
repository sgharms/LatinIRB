# LatinIRB

## DESCRIPTION

LatinIRB is an IRB session in which a user can interact with paradigmatic
Latin verbs (`@aFirst`, `@aSecond`, `@aThird`, `@aThirdIO`, `@aFourth`) as
calculated heuristically by the LatinVerb library.  

The methods of chief interest will be those that are _vectors_ within the
LatinVerb parlance i.e. methods that uniquely identify a specific conjugated
form of a verb.

An primary use case would be:
  
  @aFirst.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number #=> amō

Upon opening the script, the student may play with verbs offered for
exploration.  These are the standard paradigumatics verbs presented in
Wheelock:

     Varible  :            Parts            : meaning
  * LatinVerb : amō   amāre  amāvī  amatum  : to love / like
  * @aSecond  : moneō monēre monvī  monitum : to warn / advise
  * @aThird   : agō   agere  ēgī    actum   : to do / lead / undertake
  * @aThirdIO : capiō capere cēpī   captum  : to grab / seize
  * @aFourth  : audiō audīre audīvī auditum : to hear

## INSTANTIATING

Because LatinVerb attempts to preserve the phonographic data of a Latin verb,
the quantity of the vowels, the LatinVerb-definining string _must_ contain the
macron data so that the heuristics work.  To this end, you may use
MacronConversions to convert ASCII TeX-style transliterations of macronized
vowels to produce the correct string:

lv = LatinVerb.new(Text::Latex::Util::Macronconversions.convert('am\={o} am\={a}re am\={a}v\={i} amatum', :mc))
lv.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number #=> amō

## VIEWING

The environment takes advantage of Ruby's UTF-8 support to display the verbs
with macrons (notation representing the quantity of the vowels).  I recommend
that you use urxvt or Apple's Terminal.app for viewing these entries.

## GENERATING VERBS

Typically, in the code I have used the macron-ized character because Textmate and my Terminal of choice
both understand it.

  LatinVerb.new %w(amō   amāre  amāvī  amatum)

## EXECUTING METHODS  

Every verb in latin is a "vector" comprised of the voice / mood / tense /
number / and person

### CHART VIEW

To view the chart of a verb, use LatinVerb.chart\_display.  This is a basic
chart that will look familiar to students.  

### SINGULAR VECTOR

As such methods are of the form 

  (active|passive)\_voice\_(indicative|subjunctive)\_mood\_(present|imperfect|perfect|pastperfect|futureperfect|etc.)tense\_first\_person\_singular\_number

This will return a single value.  Where the result is ambiguous (e.g. 'number' is not provided) multiple values are returned.
an exhaustive list of options follows below.

### MULTIPLEX VECTORS

Several convenience methods exist which load multiple tenses at the same time such as "present system" or "perfect system".  These
methods load the tenses into the @collections iVar associated with the LatinVerb.  This value can be accessed as @collections
is shared per attr\_reader

### CHART VIEW

By using the LatinDisplay.chart\_view, a chart, much like what is found in verb references can be had for the verb.  This is a
_very_ handy method.

### Comprehensive List of Singular Vectors

  * LatinVerb.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_present\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_present\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_present\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_present\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_indicative\_mood\_future\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_future\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_future\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_future\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_future\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_future\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_plural\_number
   
  * LatinVerb.active\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_present\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_present\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_present\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_present\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_present\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_indicative\_mood\_future\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_future\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_future\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_future\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_future\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_future\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_plural\_number.to\_s)    
             
  * LatinVerb.passive\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_plural\_number.to\_s)                
             
  * LatinVerb.passive\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_plural\_number
             
             
  * LatinVerb.active\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.active\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.active\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_singular\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_plural\_number
  * LatinVerb.passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_plural\_number
             
  * LatinVerb.imperatives[0]
  * LatinVerb.imperatives[1]
             
  * LatinVerb.present\_active\_participle 
  * LatinVerb.future\_active\_participle
  * LatinVerb.perfect\_passive\_participle
  * LatinVerb.future\_passive\_participle
             
  * LatinVerb.present\_active\_infinitive
  * LatinVerb.perfect\_active\_infinitive
  * LatinVerb.future\_active\_infinitive
  * LatinVerb.present\_passive\_infinitive
  * LatinVerb.perfect\_passive\_infinitive)

## AUTHOR

Steven G. Harms (http://stevengharms.com)


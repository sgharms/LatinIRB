# LatinIRB

## DESCRIPTION

LatinIRB is an IRB session in which a user can interact with paradigmatic Latin
verbs (`AFIRST`, `ASECOND`, `ATHIRD`, `ATHIRDIO`, `AFOURTH`) as calculated
heuristically by the [LatinVerb](https://github.com/sgharms/LatinVerb) library.

The methods of chief interest will be those that are _vectors_ within the
LatinVerb parlance i.e. methods that uniquely identify a specific conjugated
form of a verb.

An primary use case would be:

    AFIRST.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number #=> amō

This can be a bit verbose to type, so I recommend taking advantage of `TAB`
completion:

    AFIRST.act<TAB>indic<TAB>

Upon opening the session, the student may play with verbs offered for
exploration.  These are the standard paradigmatics verbs presented in Wheelock
as well as three core irregular verbs:

<table>
  <tr><th>Varible  </th> <th>Parts                      </th> <th> Meaning</th></tr>
  <tr><td>AFIRST   </td> <td>amō   amāre  amāvī  amatum </td> <td> to love / like</td></tr>
  <tr><td>ASECOND  </td> <td>moneō monēre monvī  monitum</td> <td> to warn / advise</td></tr>
  <tr><td>ATHIRD   </td> <td>agō   agere  ēgī    actum  </td> <td> to do / lead / undertake</td></tr>
  <tr><td>ATHIRDIO </td> <td>capiō capere cēpī   captum </td> <td> to grab / seize</td></tr>
  <tr><td>AFOURTH  </td> <td>audiō audīre audīvī auditum</td> <td> to hear</td></tr>
  <tr><td>TO_BE    </td> <td>sum   esse   fuī    futūrus</td> <td> to be </td></tr>
  <tr><td>TO_CARRY </td> <td>ferō  ferre  tulī   lātum</td>   <td> to carry </td></tr>
  <tr><td>TO_COME  </td> <td>eō    īre    īvī    itum</td>    <td> to come </td></tr>
</table>

## INSTANTIATING

Because LatinVerb preserves the phonographic data of a Latin verb, the quantity
of the vowels, the LatinVerb-definining string **must** contain the macron data
so that the heuristics work.  To this end, you may use MacronConversions to
convert ASCII TeX-style transliterations of macronized vowels to produce the
correct string:

If your input device supports the quick entry of characters with macrons:

    lv = LatinVerb.new("amō amāre amāvī amatum")

But if not, you can convert an ASCII representation of the same data:

    lv = LatinVerb.new(Text::Latex::Util::Macronconversions.convert('am\={o} am\={a}re am\={a}v\={i} amatum', :mc))
    lv.active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number #=> amō

This is a bit _too_ much to have to type, so LatinIRB has the method `verb` or
`v` that combines the text conversion and the verb instantiation e.g.

    copy_of_a_first = v( 'am\={o} am\={a}re am\={a}v\={i} amatum')

## VIEWING

The environment takes advantage of Ruby's UTF-8 support to display the verbs
with macrons (notation representing the quantity of the vowels).  I recommend
that you use iTerm2, urxvt, or Apple's Terminal.app for viewing these entries.

### CHART VIEW

To view the chart of a verb, use the `chart` method.  This is a basic
chart that will look familiar to students:

    LatinIRB > chart AFIRST
    Present System
    ==============
                     Present      Imperfect         Future
                     =======      =========         ======
      1st Sg.            amō         amābam          amābō
      2nd Sg.           amās         amābās         amābis

## EXECUTING METHODS

Every verb in latin is a "vector" comprised of the voice / mood / tense /
number / and person.

### SINGULAR VECTOR

As such methods are of the form:

    (active|passive)\_voice\_(indicative|subjunctive)\_mood\_(present|imperfect|perfect|pastperfect|futureperfect|etc.)tense\_(first|second|third)\_person\_(singular|plural)\_number

This will return a single value.  Where the result is ambiguous (e.g. 'number'
is not provided) multiple values are returned.  an exhaustive list of options
follows below.

### MULTIPLEX VECTORS

Several convenience methods exist which load multiple vectors at the same time
such as "present tense."  For their invocation, see below

### Comprehensive List of Singular Vectors

  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense\_third\_person\_plural\_number.to\_s)`

  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense\_third\_person\_plural\_number.to\_s)`

  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_singular\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_first\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_second\_person\_plural\_number`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense\_third\_person\_plural\_number`

  * `LatinVerb#active\_voice\_imperative\_mood\_future\_tense`
  * `LatinVerb#active\_voice\_imperative\_mood\_present\_tense`
  * `LatinVerb#imperatives` (_aggregator method_)

  * `LatinVerb#present\_active\_participle`
  * `LatinVerb#future\_active\_participle`
  * `LatinVerb#perfect\_passive\_participle`
  * `LatinVerb#future\_passive\_participle`

  * `LatinVerb#infinitives` (_aggregator method_ : returns a keyed hash)
  * `LatinVerb#future\_active\_infinitive`
  * `LatinVerb#future\_passive\_infinitive`
  * `LatinVerb#perfect\_active\_infinitive`
  * `LatinVerb#perfect\_passive\_infinitive`
  * `LatinVerb#present\_active\_infinitive`
  * `LatinVerb#present\_passive\_infinitive`

### Ambiguous Methods

A voice, mood, and tense are all required for resolution of answers.
LatinVerb does not repsect ambiguity in those vectors.  It _does_ respect
ambiguity in the person and number specifiers.  Thus, you *may* say:

  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_first\_person`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense\_singular\_number`

This will return an array containing all possible candidates.  Thus, for
each of the items below <em>(first|second|third)_person</em> or
<em>(singular|plural)_number</em> may be postpended.

  * `LatinVerb#active\_voice\_imperative\_mood\_future\_tense`
  * `LatinVerb#active\_voice\_imperative\_mood\_present\_tense`
  * `LatinVerb#active\_voice\_indicative\_mood\_future\_tense`
  * `LatinVerb#active\_voice\_indicative\_mood\_futureperfect\_tense`
  * `LatinVerb#active\_voice\_indicative\_mood\_imperfect\_tense`
  * `LatinVerb#active\_voice\_indicative\_mood\_pastperfect\_tense`
  * `LatinVerb#active\_voice\_indicative\_mood\_perfect\_tense`
  * `LatinVerb#active\_voice\_indicative\_mood\_present\_tense`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_imperfect\_tense`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_pastperfect\_tense`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_perfect\_tense`
  * `LatinVerb#active\_voice\_subjunctive\_mood\_present\_tense`
  * `LatinVerb#passive\_voice\_indicative\_mood\_future\_tense`
  * `LatinVerb#passive\_voice\_indicative\_mood\_futureperfect\_tense`
  * `LatinVerb#passive\_voice\_indicative\_mood\_imperfect\_tense`
  * `LatinVerb#passive\_voice\_indicative\_mood\_pastperfect\_tense`
  * `LatinVerb#passive\_voice\_indicative\_mood\_perfect\_tense`
  * `LatinVerb#passive\_voice\_indicative\_mood\_present\_tense`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_imperfect\_tense`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_pastperfect\_tense`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_perfect\_tense`
  * `LatinVerb#passive\_voice\_subjunctive\_mood\_present\_tense`

## AUTHOR

[Steven G. Harms](http://stevengharms.com)

## THANKS

Thanks to the Austin Ruby coders group who answered questions that helped me put this all together.  Thanks also
to the Reject^{2} conference at the Lone Star Ruby Conference 2008 who helped me think through some of the
metaprogrammatic approaches.  Thanks to Professor James Burleson of Austin Community College who insisted,
old-style, of a mastery of the rote basics of Latin.  Thanks also to [Lauren Roth](http://www.laurennroth.com)
for her support and encouragement and understanding of my pre-dawn hack sessions.

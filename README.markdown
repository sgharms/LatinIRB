# LatinIRB

## DOCKER USE

The following application is wonderfully used within Docker. To use it so:

```shell
$ docker build -t latinirb . 
$ docker run -it --rm -v $(pwd):/workarea latinirb

... visual content snipped ...
LatinIRB > puts AFIRST.active_voice_indicative_mood_present_tense_first_person_singular_number
amō
```

## DESCRIPTION

LatinIRB is an IRB session in which a user can interact with paradigmatic Latin
verbs (`AFIRST`, `ASECOND`, `ATHIRD`, `ATHIRDIO`, `AFOURTH`) as calculated
heuristically by the [LatinVerb](https://github.com/sgharms/LatinVerb) library.

The methods of chief interest will be those that are _vectors_ within the
LatinVerb parlance i.e. methods that uniquely identify a specific conjugated
form of a verb.

An primary use case would be:

    AFIRST.active_voice_indicative_mood_present_tense_first_person_singular_number #=> amō

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
    lv.active_voice_indicative_mood_present_tense_first_person_singular_number #=> amō

This is a bit _too_ much to have to type, so LatinIRB has the method `verb` or
`v` that combines the text conversion and the verb instantiation e.g.

    copy_of_a_first = v( 'am\={o} am\={a}re am\={a}v\={i} amatum')

Finally, LatinIRB exposes a method `s()` which loads the contents of a file of the form:

```text
reckon:put\={o}, put\={a}re, put\={a}v\={\i}, putatum
```

and saves it into a `Hash` called `SEED` where the key remains e.g. `reckon`
but points to a LatinVerb instance such that one can:

```ruby
chart(SEED['reckon'])
```

as described below.

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

    (active|passive)_voice_(indicative|subjunctive)_mood_(present|imperfect|perfect|pastperfect|futureperfect|etc.)tense_(first|second|third)_person_(singular|plural)_number

This will return a single value.  Where the result is ambiguous (e.g. 'number'
is not provided) multiple values are returned.  An exhaustive list of options
follows below.

### MULTIPLEX VECTORS

Several convenience methods exist which load multiple vectors at the same time
such as "present tense."  For their invocation, see below

### Comprehensive List of Singular Vectors

  * `LatinVerb#active_voice_indicative_mood_present_tense_first_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_present_tense_second_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_present_tense_third_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_present_tense_first_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_present_tense_second_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_present_tense_third_person_plural_number`

  * `LatinVerb#active_voice_indicative_mood_imperfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_imperfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_imperfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_imperfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_imperfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_imperfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_indicative_mood_future_tense_first_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_future_tense_second_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_future_tense_third_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_future_tense_first_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_future_tense_second_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_future_tense_third_person_plural_number`

  * `LatinVerb#active_voice_indicative_mood_perfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_perfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_perfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_perfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_perfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_perfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_indicative_mood_present_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_present_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_present_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_present_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_present_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_present_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_indicative_mood_future_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_future_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_future_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_future_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_future_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_future_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_indicative_mood_perfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_perfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_perfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_perfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_perfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)`

  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)`

  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_subjunctive_mood_present_tense_first_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_present_tense_second_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_present_tense_third_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_present_tense_first_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_present_tense_second_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_present_tense_third_person_plural_number`

  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number`
  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number`
  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_subjunctive_mood_present_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_present_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_present_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_present_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_present_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_present_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number`

  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number`
  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number`
  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number`

  * `LatinVerb#active_voice_imperative_mood_future_tense`
  * `LatinVerb#active_voice_imperative_mood_present_tense`
  * `LatinVerb#imperatives` (_aggregator method_)

  * `LatinVerb#present_active_participle`
  * `LatinVerb#future_active_participle`
  * `LatinVerb#perfect_passive_participle`
  * `LatinVerb#future_passive_participle`

  * `LatinVerb#infinitives` (_aggregator method_ : returns a keyed hash)
  * `LatinVerb#future_active_infinitive`
  * `LatinVerb#future_passive_infinitive`
  * `LatinVerb#perfect_active_infinitive`
  * `LatinVerb#perfect_passive_infinitive`
  * `LatinVerb#present_active_infinitive`
  * `LatinVerb#present_passive_infinitive`

### Ambiguous Methods

A voice, mood, and tense are all required for resolution of answers.
LatinVerb does not repsect ambiguity in those vectors.  It _does_ respect
ambiguity in the person and number specifiers.  Thus, you *may* say:

  * `LatinVerb#active_voice_indicative_mood_present_tense_first_person`
  * `LatinVerb#active_voice_indicative_mood_present_tense_singular_number`

This will return an array containing all possible candidates.  Thus, for
each of the items below <em>(first|second|third)_person</em> or
<em>(singular|plural)_number</em> may be postpended.

  * `LatinVerb#active_voice_imperative_mood_future_tense`
  * `LatinVerb#active_voice_imperative_mood_present_tense`
  * `LatinVerb#active_voice_indicative_mood_future_tense`
  * `LatinVerb#active_voice_indicative_mood_futureperfect_tense`
  * `LatinVerb#active_voice_indicative_mood_imperfect_tense`
  * `LatinVerb#active_voice_indicative_mood_pastperfect_tense`
  * `LatinVerb#active_voice_indicative_mood_perfect_tense`
  * `LatinVerb#active_voice_indicative_mood_present_tense`
  * `LatinVerb#active_voice_subjunctive_mood_imperfect_tense`
  * `LatinVerb#active_voice_subjunctive_mood_pastperfect_tense`
  * `LatinVerb#active_voice_subjunctive_mood_perfect_tense`
  * `LatinVerb#active_voice_subjunctive_mood_present_tense`
  * `LatinVerb#passive_voice_indicative_mood_future_tense`
  * `LatinVerb#passive_voice_indicative_mood_futureperfect_tense`
  * `LatinVerb#passive_voice_indicative_mood_imperfect_tense`
  * `LatinVerb#passive_voice_indicative_mood_pastperfect_tense`
  * `LatinVerb#passive_voice_indicative_mood_perfect_tense`
  * `LatinVerb#passive_voice_indicative_mood_present_tense`
  * `LatinVerb#passive_voice_subjunctive_mood_imperfect_tense`
  * `LatinVerb#passive_voice_subjunctive_mood_pastperfect_tense`
  * `LatinVerb#passive_voice_subjunctive_mood_perfect_tense`
  * `LatinVerb#passive_voice_subjunctive_mood_present_tense`

## AUTHOR

[Steven G. Harms](http://stevengharms.com)

## THANKS

Thanks to the Austin Ruby coders group who answered questions that helped me put this all together.  Thanks also
to the Reject^{2} conference at the Lone Star Ruby Conference 2008 who helped me think through some of the
metaprogrammatic approaches.  Thanks to Professor James Burleson of Austin Community College who insisted,
old-style, of a mastery of the rote basics of Latin.  Thanks also to [Lauren Roth](http://www.laurennroth.com)
for her support and encouragement and understanding of my pre-dawn hack sessions.

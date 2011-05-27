# encoding: utf-8

require 'macronconversions'

module Linguistics
  module Latin
    module Util
      class LatinIRB
        @aFirst   = Linguistics::Latin::Verb::LatinVerb.new Text::Latex::Util::Macronconversions.convert('am\={o} am\={a}re am\={a}v\={\i} amatum', 'mc')
        @aSecond  = Linguistics::Latin::Verb::LatinVerb.new %q(moneō monēre monvī  monitum)
        @aThird   = Linguistics::Latin::Verb::LatinVerb.new %q(agō   agere  ēgī    actum)
        @aThirdIO = Linguistics::Latin::Verb::LatinVerb.new %q(capiō capere cēpī   captum)
        @aFourth  = Linguistics::Latin::Verb::LatinVerb.new %q(audiō audīre audīvī auditum)
      end
    end
  end
end

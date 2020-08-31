class Text < ApplicationRecord
  has_and_belongs_to_many :users

  before_save do
    readability = 0
    sentences_count = self.text.scan(/[^?!.][?!.]/).count
    words_count = self.text.split.count
    asl = words_count/sentences_count
    lang = DetectLanguage.simple_detect(self.text)

    case lang
    when "en"
      syllables_count = self.text.scan(/[aeiouyAEIOUY]+[^$(),.:;!?"']/).count
      asw = syllables_count/words_count
      readability = 206.835 - (1.015 * asl) - (84.6 * asw)
    when "ru"
      syllables_count = self.text.scan(/[аеиоуыэюяАЕИОУЭЮЯ]/).count
      asw = syllables_count/words_count
      readability = 206.835 - (1.3 * asl) - (60.1 * asw)
    when "uk"
      syllables_count = self.text.scan(/[аеєиіїоюяАЕЄІЇОЮЯ]/).count
      asw = syllables_count/words_count
      readability = 206.835 - (1.35 * asl) - (64.3 * asw)
    end
    self.readability = readability
  end
end

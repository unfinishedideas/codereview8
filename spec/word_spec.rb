require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it('Shows all the words') do
      word1 = Word.new("Zoombini", "A strange fluffy creature with mismatched features", nil)
      word1.save
      word2 = Word.new("Cutenessvom", ["When something is so cute you vomit"], nil)
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('.save') do
    it('Saves a word to @@words_list class hash variable') do
      word1 = Word.new("Zoombini", "A strange fluffy creature with mismatched features", nil)
      word1.save
      expect(Word.all).to(eq([word1]))
    end
  end

  describe('#==') do
    it('Tests overwrite of == operator to match words by name') do
      word1 = Word.new("Zoombini", "A strange fluffy creature with mismatched features", nil)
      word1.save
      word2 = Word.new("Zoombini", "A strange fluffy creature with mismatched features", nil)
      word2.save
      expect(word1).to(eq(word2))
    end
  end

end

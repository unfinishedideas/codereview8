class Word
  attr_reader :name, :id, :definitions
  @@words_list = {}
  @@rows = 0

  def initialize(name, definitions, id)
    @name = name
    @id = id || @@rows += 1
  end

  def ==(word_to_compare)
    (self.name() == word_to_compare.name())
  end

  def self.all()
    return @@words_list.values()
  end

  def self.save()
    @@words_list[self.id] = Word.new(self.name, self.id, self.definitions)
  end

  def self.clear()
    @@words_list = {}
    @@rows = 0
  end

  def self.find(id)
    @@words_list[id]
  end

  def update(name, definitions)
    @name = name
    @definitions = definitions
  end

  def delete()
    @@words.delete(self.id)
  end

  def self.search(name)
    return_arry = @@words.values.select { |word| word.name.downcase == name.downcase}
    if return_arry != []
      return_arry.sort_by(&:name)
    end
  end

  def definitions()
    Definitions.find_by_word(self.id)
  end

end

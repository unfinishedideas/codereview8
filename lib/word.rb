class Word
  attr_reader :name, :id, :definitions
  @@words_list = {}
  @@rows = 0

  def initialize(name, definitions, id)
    @name = name
    @definitions = []
    @id = id || @@rows += 1
  end

  def ==(word_to_compare)
    (self.name() == word_to_compare.name())
  end

  def save
    @@words_list[self.id] = Word.new(self.name, self.definitions, self.id)
  end

  def delete()
    @@words_list.delete(self.id)
  end

  def self.all()
    return @@words_list.values()
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

  def self.search(string)
    @@words_list.values().select {|e| /#{string}/i.match(e.name) }
  end

  # def definitions()
  #   Definition.find_by_word(self.id)
  # end
end

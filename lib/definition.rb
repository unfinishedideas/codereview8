class Definition
  attr_reader :text, :id, :word_id

  @@definitions_list = {}
  @@def_rows = 0

  def initialize(text, id, word_id)
    @text = text
    @id = id || @@def_rows += 1
    @word_id = word_id
  end

  def ==(definition_to_compare)
    (self.text() == definition_to_compare.text())
  end

  def self.all()
    return @@definitions_list.values()
  end

  def save()
    @@definitions_list[self.id] = Definition.new(self.text, self.id, self.word_id)
  end

  def self.clear()
    @@definitions_list = {}
    @@def_rows = 0
  end

  def self.find(id)
    @@definitions_list[id]
  end

  def update(text)
    @text = text
  end

  def update_word_id(word_id)
    @word_id = word_id
  end

  def delete()
    @@definitions_list.delete(self.id)
  end

  def self.search(string)
    @@definitions_list.values().select {|e| /#{string}/i.match(e.text) }
  end

  # def definitions()
  #   Definitions.find_by_definition(self.id)
  # end


end

class Definition
  attr_reader :text, :id
  @@definitions_list = {}
  @@def_rows = 0

  def initialize(text, id)
    @text = text
    @id = id || @@def_rows += 1
  end

  def ==(definition_to_compare)
    (self.text() == definition_to_compare.text())
  end

  def self.all()
    return @@definitions_list.values()
  end

  def save()
    @@definitions_list[self.id] = Definition.new(self.text, self.id)
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

  def delete()
    @@definitions.delete(self.id)
  end

  def self.search(string)
    @@definitions_list.values().select {|e| /#{string}/i.match(e.text) }
  end

  # def definitions()
  #   Definitions.find_by_definition(self.id)
  # end


end

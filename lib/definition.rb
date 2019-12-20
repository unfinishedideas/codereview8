class Definition
@@definitions_list = {}
@@def_rows = 0

def initialize(text, id)
  @text = text
  @id = id || @def_rows += 1
end

def ==(definition_to_compare)
  (self.name() == definition_to_compare.name())
end

def self.all()
  return @@definitions_list.values()
end

def self.save()
  @@definitions_list[self.id] = Word.new(self.text, self.id)
end

def self.clear()
  @@definitions_list = {}
  @@rows = 0
end

def self.find(id)
  @@definitions_list[id]
end

def update(name, definitions)
  @name = name
  @definitions = definitions
end

def delete()
  @@definitions.delete(self.id)
end

def self.search(name)
  return_arry = @@definitions.values.select { |definition| definition.name.downcase == name.downcase}
  if return_arry != []
    return_arry.sort_by(&:name)
  end
end

def definitions()
  Definitions.find_by_definition(self.id)
end


end

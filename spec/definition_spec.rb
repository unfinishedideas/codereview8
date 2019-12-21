require 'rspec'
require 'definition'
require 'word'
require 'pry'
describe '#Definition' do

  before(:each) do
    Definition.clear()
  end

  describe('.all') do
    it('Shows all the definitions in @@definitions_list') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition2 = Definition.new('Is really old', nil, 0)
      definition2.save
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('#save') do
    it('should save a definition with a unique ID to @@definitions_list') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('#==') do
    it('should overwrite == operator to compare definitions by text') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition2 = Definition.new('Something shiny', nil, 0)
      definition2.save
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.clear') do
    it('should clear the list of definitions when called') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition2 = Definition.new('Is really old', nil, 0)
      definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('should be able to find a definition by ID') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition2 = Definition.new('Is really old', nil, 0)
      definition2.save
      expect(Definition.find(2).text).to(eql(definition2.text))
    end
  end

  describe('#update') do
    it('should be able to update the text of a definition') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition1.update("nope")
      expect(definition1.text).to(eql("nope"))
    end
  end

  describe('#delete') do
    it('should delete a definition from @@definitions_list') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition2 = Definition.new('Is really old', nil, 0)
      definition2.save
      definition1.delete
      # For some reason when definition is in an array it would not overwrite == operator like above, using test_array to prove it is in fact deleting definition1 here. Similar methodology employed on .search below
      test_array = Definition.all
      expect(test_array[0].text).to(eql(definition2.text))
      expect(test_array.length).to(eql(1))
    end
  end

  describe('.search') do
    it('should be able to find a Definition by contents of text, regardless of case and return an array of the results') do
      definition1 = Definition.new('Something shiny', nil, 0)
      definition1.save
      definition2 = Definition.new('Is really old', nil, 0)
      definition2.save
      test_result_array = Definition.search("rEaLlY oLd")
      expect(test_result_array[0].text).to(eql(definition2.text))
    end
  end

end

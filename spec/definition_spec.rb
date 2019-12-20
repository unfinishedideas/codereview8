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
      def1 = Definition.new('Something shiny', nil)
      def1.save
      def2 = Definition.new('Is really old', nil)
      def2.save
      expect(Definition.all).to(eq([def1, def2]))
    end
  end

  describe('#save') do
    it('should save a definition with a unique ID to @@definitions_list') do
      def1 = Definition.new('Something shiny', nil)
      def1.save
      expect(Definition.all).to(eq([def1]))
    end
  end


end

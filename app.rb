require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

# Get Homepage
get('/') do
  @words = Word.all()
  erb(:home)
end

get('/home/') do
  @words = Word.all()
  erb(:home)
end

# Get New Word page
get('/home/new_word') do
  @words = Word.all()
  erb(:new_word)
end

get('/home/word/:word_id/definition/:definition_id') do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:edit_definition)
end

# Get View Word page
get('/home/word/:word_id') do
  @word = Word.find(params[:word_id].to_i())
  @definitions_list = Definition.all()
  erb(:view_word)
end

# Get Edit Definition Page
get('/home/word/:word_id/definition/:definition_id') do
  @word = Word.find(params[:word_id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:edit_definition)
end

# Get New Definition page
get('/home/word/:word_id/new_definition') do
  @word = Word.find(params[:word_id].to_i)
  erb(:new_definition)
end

# Post new word, return to home
post('/home') do
  name = params[:name_input]
  new_word = Word.new(name, nil)
  definition = Definition.new(params[:definition_input], nil, new_word.id)
  definition.save()
  new_word.save()
  @words = Word.all()
  erb(:home)
end

# Post a new definition, return to word display
post('/home/word/:word_id') do
  input_definition = params[:new_definition_input]
  new_definition = Definition.new(input_definition, nil, params[:word_id].to_i)
  new_definition.save()
  @definitions_list = Definition.all()
  @word = Word.find(params[:word_id].to_i)
  erb(:view_word)
end

# Update a definition
patch('/home/word/:word_id/definition/:definition_id') do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  text = params[:redefine_input]
  @definition.update(text)
  @definitions_list = Definition.all()
  erb(:view_word)
end

# Delete a definition
delete('/home/word/:word_id/definition/:definition_id/edit') do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  @definition.delete()
  @definitions_list = Definition.all()
  erb(:view_word)
end

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

# Get View Word page
get('/home/:word_id') do
  @word = Word.find(params[:word_id].to_i())
  @definitions = @word.definitions
  erb(:view_word)
end

# Get Edit Definition Page
get('/home/:word_id/edit/:definition_id') do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:edit_definition)
end

# Post new word, return to home
post('/home') do
  name = params[:name_input]
  definition = Definition.new(params[:definition_input], nil, 0)
  new_word = Word.new(name, [definition], nil)
  new_word.definitions[0].update_word_id(new_word.id)
  definition.save()
  new_word.save()
  @words = Word.all()
  erb(:home)
end

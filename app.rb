require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:home)
end

get('/home/') do
  @words = Word.all()
  erb(:home)
end

get('/home/new_word') do
  @words = Word.all()
  erb(:new_word)
end

post('/home') do
  name = params[:name_input]
  definition = params[:definition_input]
  new_word = Word.new(name, definition, nil)
  binding.pry
  new_word.save()
  @words = Word.all()
  erb(:home)
end

# post('/LOTR_Fest') do
#   name = params[:stage_name]
#   location = params[:stage_location]
#   date = params[:stage_date]
#   ##THIS IS WHERE A IF/ELSE WOULD GO TO PREVENT EMPTY INPUT
#   stage = Stage.new(nil, name, location, date)
#   stage.save()
#   @stages = Stage.all()
#   erb(:home)
# end

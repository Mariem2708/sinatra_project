require 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {array_gossip: Gossip.all} #methode locals: la variable array_gossip fait reference a Gossip.all qui est le array du csv avec author, content
    # on pourras du coup utiliser cette variable dans notre fichier erb(cf: index.erb où l'on parcour l'array)
  end 
  get '/gossips/new/' do #la methode get c'est pour une url(ex: http://localhost:4567/gossips/new/)
    erb :new_gossip       # erb :new_gossip  renvoie au fichier new.gossip.erb dans cet exemple
  end
  post '/gossips/new/' do #la methode post c'est pour un formulaire quand on submit
    Gossip.new(params["gossip_author"],params["gossip_content"]).save #le params ( variable ultime)c'est un hash ou est stocké l'author et le content(exemple d'un puts: voilà ce que retourne le termianl {"gossip_author"=>"Mariem", "gossip_content"=>"BG"})
    redirect '/' # a la fin de mon submit je redirige a la page index 
  end
  get '/bingo_gossip/:id' do
    erb :show, locals: {id:params['id'].to_i, bingo_gossip: Gossip.find(params['id'].to_i),array_gossip: Gossip.all }
  end
end
  
require 'sinatra/base'

class FaxApp < Sinatra::Base
  get '/' do
    erb :index
  end
end

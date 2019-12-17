require 'sinatra/base'

class FaxApp < Sinatra::Base
  get '/' do
    "Hello World!"
  end
end

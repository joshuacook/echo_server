# encoding: utf-8
class MyApp < Sinatra::Application
  get "/" do
    slim :index
  end
end
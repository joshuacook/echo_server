# encoding: utf-8
class MyApp < Sinatra::Application
  get "/" do
    slim :index
  end
  
  get "/adwords" do
    slim :adwords
  end
end

# encoding: utf-8
class MyApp < Sinatra::Application
  get "/" do
    slim :index
  end
  
  get "/adwords" do
    slim :adwords
  end

  get "/ds3" do
    slim :ds3
  end
end

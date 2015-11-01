# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    request.body.rewind
    input = request.body.read    
    input
  end
end

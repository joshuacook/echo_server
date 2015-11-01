# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    status 200
    body "Success.\n"
  end
end

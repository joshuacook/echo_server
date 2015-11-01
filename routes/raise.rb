# encoding: utf-8
class MyApp < Sinatra::Application
  get '/raise' do
    id = param[:id]
    status 200
    body "Success. #{id} \n"
  end
end

# encoding: utf-8
class MyApp < Sinatra::Application
  get '/raise' do
    id = params[:id]
    status 200
    body "Success. #{id} \n"
  end
end

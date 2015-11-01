# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    id = params[:id]    
    if id = "foo"
      status 200
      body "Success. #{id} \n"
    else
      status 400
      body "Fail"
    end
  end
end

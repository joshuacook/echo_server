# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    id = params[:id]    
    if id = "D7120D12-1A1AD576"
      status 200
      body "Success. #{id} \n"
    else
      status 400
      body "Fail"
    end
  end
end

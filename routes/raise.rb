# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    id = params[:id]    
    if id == "079E6612-FAEADB76"
      status 200
      body "Success. #{id} \n"
    else
      status 400
      body "Fail"
    end
  end
end

# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    id = params[:id]    
    if id = "foo"
      status 200 if id="foo"
      body "Success. #{id} \n" if id="foo"
    else
      status 400 unless id="foo"
      body "Fail" unless id = "foo"
    end
  end
end

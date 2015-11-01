# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    id = params[:id]    
    status 400 unless id="foo"
    status 200 if id="foo"
    body "Fail" unless id = "foo"
    body "Success. #{id} \n" if id="foo"
  end
end

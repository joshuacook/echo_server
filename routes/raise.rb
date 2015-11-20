# encoding: utf-8
class MyApp < Sinatra::Application
  post '/doubleclick' do
    request.body.rewind
    input = JSON.parse request.body.read.gsub('=>', ':')
    logger.debug "Handling 'doubleclick' request."
    clickId = input['conversion'][0]['clickId']
    if clickId == 'goodclid_uno'
      status 200
      body "Success."
    elsif clickId == 'want500'
      status 200
      body "Success."
    elsif clickId == 'want500'
      status 500
      body "Dis is awful. Dis is just awful."
    else
      status 400
      body "Womp womp, you fail."
    end
  end
  post '/custom' do
    request.body.rewind
    input = JSON.parse request.body.read.gsub('=>', ':')
    logger.debug "Handling 'custom' request."
    status 200
    body "success
  end
end

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
    logger.debug "Handling 'doubleclick' request."
    status 200
    body "Going to change this in a moment"
  end
end



# curl -H "Content-Type: application/json" -XPOST -d '{"kind"=>"doubleclicksearch#conversionList", "conversion"=>[{"clickId"=>"badclid_two", "conversionTimestamp"=>"1446415352900", "conversionId"=>"F77FE112-EA3ADD76", "segmentationType"=>"FLOODLIGHT", "segmentationName"=>"offline_calls_trans", "type"=>"TRANSACTION", "revenueMicros"=>"1000000", "currencyCode"=>"USD"}]}' http://dry-castle-8995.herokuapp.com/raise

# '{"kind"=>"doubleclicksearch#conversionList", "conversion"=>[{"clickId"=>"badclid_two", "conversionTimestamp"=>"1446415352900", "conversionId"=>"F77FE112-EA3ADD76", "segmentationType"=>"FLOODLIGHT", "segmentationName"=>"offline_calls_trans", "type"=>"TRANSACTION", "revenueMicros"=>"1000000", "currencyCode"=>"USD"}]}'

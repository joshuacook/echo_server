# encoding: utf-8
class MyApp < Sinatra::Application
  post '/raise' do
    request.body.rewind
    input = JSON.parse request.body.read.gsub('=>', ':')
    logger.debug "Handling 'doubleclick' request."
    if input['conversion'][0]['clickId'] == 'bad'
      status 200
      body "Success."
    elsif input['conversion'][0]['clickId'] == 'bad'
      status 200
      body "Success."
    else
      status 400
      body "Womp womp, you fail."
    end
  end
end



# curl -H "Content-Type: application/json" -XPOST -d '{"kind"=>"doubleclicksearch#conversionList", "conversion"=>[{"clickId"=>"badclid_two", "conversionTimestamp"=>"1446415352900", "conversionId"=>"F77FE112-EA3ADD76", "segmentationType"=>"FLOODLIGHT", "segmentationName"=>"offline_calls_trans", "type"=>"TRANSACTION", "revenueMicros"=>"1000000", "currencyCode"=>"USD"}]}' http://dry-castle-8995.herokuapp.com/raise

# '{"kind"=>"doubleclicksearch#conversionList", "conversion"=>[{"clickId"=>"badclid_two", "conversionTimestamp"=>"1446415352900", "conversionId"=>"F77FE112-EA3ADD76", "segmentationType"=>"FLOODLIGHT", "segmentationName"=>"offline_calls_trans", "type"=>"TRANSACTION", "revenueMicros"=>"1000000", "currencyCode"=>"USD"}]}'
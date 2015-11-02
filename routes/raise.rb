# encoding: utf-8



get '/' do


class MyApp < Sinatra::Application
  post '/raise' do
    request.body.rewind
    input = request.body.read    
    puts input
    logger.debug "Handling 'hello world' request."
    logger.info "Hello world."
  end
end



# curl -H "Content-Type: application/json" -XPOST -d '{"kind"=>"doubleclicksearch#conversionList", "conversion"=>[{"clickId"=>"badclid_two", "conversionTimestamp"=>"1446415352900", "conversionId"=>"F77FE112-EA3ADD76", "segmentationType"=>"FLOODLIGHT", "segmentationName"=>"offline_calls_trans", "type"=>"TRANSACTION", "revenueMicros"=>"1000000", "currencyCode"=>"USD"}]}' http://dry-castle-8995.herokuapp.com/raise
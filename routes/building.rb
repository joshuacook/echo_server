post '/building/*.*' do
  basic_request_information  
  if request.path.split('.')[1] == 'xml'
    parse_XML_payload_to_Hash
    status 200
  elsif request.path.split('.')[1] == 'json'
    parse_JSON_payload_to_Hash
    status 200    
  elsif request.path.split('.')[1] == 'html'
    parse_HTTP_params_to_Hash
    status 200
  end
end

get '/building.html' do
  basic_request_information
  parse_HTTP_params_to_Hash
  status 200
end


__END__

curl -d "<xml><city>[city]</city><num>[calling_phone_number]</num><press>[keypress_4]</press></xml>" http://localhost:9292/building/foo.xml
curl -d '{"city":"city","num":"calling_phone_number","press":"keypress_4"}' http://localhost:9292/building/foo.json
curl -d http://localhost:9292/building/foo.html?city=city,num=calling_phone_number,press=keypress_4
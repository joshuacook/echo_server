module Handler

  def get_payload
    request.body.rewind
    request.body.read
  end
  
  def parse_HTTP_params_to_Hash
    logger.debug request.params
    request.params
  end

  def parse_JSON_payload_to_Hash
    request_payload = JSON.parse get_payload
    logger.debug request_payload
    request_payload
  end

  def parse_XML_payload_to_Hash
    request_payload = Hash.new
    fragments = Nokogiri::Slop(get_payload).xml.children
    fragments.each do |fragment|
      request_payload[fragment.node_name] = fragment.content
    end
    logger.debug request_payload
    return request_payload
  end 
  
  def build_json_response(key,value)
    { key.to_sym => value }.to_json
  end
  
  def build_xml_response(key,value)
    "<xml><#{key}>#{value}</#{key}></xml>"
  end
  
  def build_http_response(key,value)
    { key.to_sym => value }
  end
   
  def prepend_to_hooklog_txt(ip,method,request_format,payload)
    `echo "\n#{Time.now}\t#{ip}\t#{method}\tformat: #{request_format.to_s}\tpayload: #{payload.to_s}" >> public/hooklog.txt`
    #`{ echo #{Time.now}\t#{ip}\tmethod: #{method}\tformat: #{request_format}\tpayload: #{payload}; cat public/hooklog.txt; } > public/tmp.txt && mv public/tmp.txt public/hooklog.txt`
  end

  def request_parser(path)
    request_format = path.split('.')[1]
    if request_format == 'xml'
      request_payload = parse_XML_payload_to_Hash
    elsif request_format == 'json'
      request_payload = parse_JSON_payload_to_Hash
    elsif request_format == 'html'
      request_payload = parse_HTTP_params_to_Hash
    end 
    return request_format, request_payload
  end 
  
  def response_builder(response_format,key,value,ip)
    if response_format == 'xml'
      content_type 'text/xml'
      build_xml_response(key,value)
    elsif response_format == 'json'
      content_type :json
      build_json_response(key,value)
    elsif response_format == 'http'
      status 200
      Net::HTTP.post_form(ip,build_http_response(key,value))
    end
  end   
end

__END__
curl -H "Content-Type: application/json" -XPOST -d '{"format":"http"}' http://localhost:9292/real_time_routing/destination_phone_number.json
curl -H "Content-Type: application/xml" -XPOST -d '<xml><format>http</format></xml>' http://localhost:9292/real_time_routing/destination_phone_number.xml

curl -H "Content-Type: application/json" -XPOST -d '{"format":"json"}' http://localhost:9292/real_time_routing/destination_phone_number.json
curl -H "Content-Type: application/json" -XPOST -d '{"format":"xml"}' http://localhost:9292/real_time_routing/destination_phone_number.json
curl -H "Content-Type: application/xml" -XPOST -d '<xml><format>json</format></xml>' http://localhost:9292/real_time_routing/destination_phone_number.xml
curl -H "Content-Type: application/xml" -XPOST -d '<xml><format>xml</format></xml>' http://localhost:9292/real_time_routing/destination_phone_number.xml
curl -H "Content-Type: application/json" -XPOST -d '{"format":"json","ids":[82420,84321,7964,3424,632]}' http://localhost:9292/real_time_routing/destination_campaign_id_from_network.json
curl -H "Content-Type: application/json" -XPOST -d '{"format":"xml","ids":[82420,84321,7964,3424,632]}' http://localhost:9292/real_time_routing/destination_campaign_id_from_network.json
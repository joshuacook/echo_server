module Handler

  def get_payload
    request.body.rewind
    request.body.read
  end
  
  def parse_HTTP_params_to_Hash
    get_payload
    request_payload = request.params
    logger.debug request_payload
    request_payload
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
    response = { key.to_sym => value }.to_json
    logger.debug "responding with #{response} via json"
    response
  end
  
  def build_xml_response(key,value)
    response = "<?xml version="1.0" encoding="UTF-8"?><#{key}>#{value}</#{key}>"
    logger.debug "responding with #{response} via xml"
    response
  end
  
  def build_xml_soap_response(key,value)
    response = "<?xml version='1.0' encoding='UTF-8'?><soap12:Envelope xmlns:soap12='http://www.w3.org/2003/05/soap-envelope' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'><soap12:Body><#{key}>#{value}</#{key}>   </soap12:Body></soap12:Envelope>"
    logger.debug "responding with #{response} via xml-soap"
    response
  end
  
  def build_http_response(key,value)
    response = { key.to_sym => value }
    logger.debug "responding with #{response} via http post"
    response
  end
   
  def prepend_to_hooklog_txt(ip,method,request_format,payload)
    this_hook = "#{Time.now}\t#{ip}\t#{method}\tformat: #{request_format.to_s}\tpayload: #{payload  }\n"
    log       = `cat public/hooklog.txt`
    `echo "#{this_hook}#{log}" > public/hooklog.txt`
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
    elsif response_format == 'xml-soap'
      content_type 'text/xml'
      build_xml_response(key,value)
    elsif response_format == 'json'
      content_type :json
      build_json_response(key,value)
    elsif response_format == 'http'
      status 200
      Net::HTTP.post_form URI("http://#{ip}"), build_http_response(key,value)
    end
  end   
end

__END__

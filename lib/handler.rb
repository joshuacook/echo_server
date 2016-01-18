module Handler

  def get_payload
    request.body.rewind
    request.body.read
  end
  
  def parse_HTTP_params_to_Hash
    this_request = get_payload
    request_payload = Hash.new
    logger.debug "request_payload #{this_request}"
    request.params.each do |key,value|
      n = value.length
      if value[0]="[" and value[n-1]="]"
        request_payload[key] = value.gsub(/\[|\]/,'').split(',').map(&:to_i) 
      else
        request_payload[key] = value
      end
    end
    
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
    noko_object = Nokogiri::XML(get_payload)
    request_payload['ids'] = noko_object.search('bundled_destination_id').map(&:text) unless noko_object.search('bundled_destination_id').empty?
    request_payload['ids'] = noko_object.search('bundled_destination_id_from_network').map(&:text) unless noko_object.search('bundled_destination_id_from_network').empty?
    logger.debug request_payload
    return request_payload
  end 
  
  def build_json_response(key,value)
    response = { key.to_sym => value }.to_json # {'destintion_phone_number' : '895
    logger.debug "responding with #{response} via json"
    response
  end
  
  def build_xml_response(key,value)
    response = "<?xml version='1.0' encoding='UTF-8'?><#{key}>#{value}</#{key}>"
    logger.debug "responding with #{response} via xml"
    response
  end
  
  def build_xml_soap_response(key,value)
    response = "<?xml version='1.0' encoding='UTF-8'?><soap12:Envelope xmlns:soap12='http://www.w3.org/2003/05/soap-envelope' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'><soap12:Body><#{key}>#{value}</#{key}>   </soap12:Body></soap12:Envelope>"
    logger.debug "responding with #{response} via xml-soap"
    response
  end    
   
  def prepend_to_hooklog_txt(ip,method,request_format,payload)
    this_hook = "#{Time.now}\t#{ip}\t#{method}\tformat: #{request_format.to_s}\tpayload: #{payload  }\n"
    log       = `cat public/hooklog.txt`
    `echo "#{this_hook}#{log}" > public/hooklog.txt`
  end

  def request_parser(media_type)
    if media_type == 'application/xml'
      request_payload = parse_XML_payload_to_Hash
    elsif media_type == 'application/json'
      request_payload = parse_JSON_payload_to_Hash
    elsif media_type == 'application/x-www-form-urlencoded'
      request_payload = parse_HTTP_params_to_Hash
    end 
    return request_payload
  end 
  
  def get_response_format(path)
    path.split('.')[1]
  end
  
  def response_builder(response_format,key,value,ip)
    if response_format == 'xml'
      content_type 'text/xml'
      build_xml_response(key,value)
    elsif response_format == 'xml_soap'
      content_type 'text/xml'
      build_xml_soap_response(key,value)
    elsif response_format == 'json'
      content_type :json
      build_json_response(key,value)
    end
  end   
end

__END__

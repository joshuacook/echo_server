module Handler

  def get_payload(request)
    request.body.rewind
    request.body.read
  end

  def get_XML_payload
    request.body.rewind
    request_payload = XML.parse request.body.read 
    
    `echo #{request_payload} >> her.log`
  end
  
end
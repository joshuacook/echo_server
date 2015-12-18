module StandardLogging
  def basic_request_information
    logger.debug   "body: #{request.body}"
    logger.debug   "scheme: #{request.scheme}"
    logger.debug   "port: #{request.port}"
    logger.debug   "request_method: #{request.request_method}"
    logger.debug   "query_string: #{request.query_string}"
    logger.debug   "content_length: #{request.content_length}"
    logger.debug   "media_type: #{request.media_type}"
    logger.debug   "host: #{request.host}"
    logger.debug   "request_method: #{request.request_method}"
    logger.debug   "url: #{request.url}"
    logger.debug   "path: #{request.path}"
    logger.debug   "ip: #{request.ip}"
    return request.ip, request.request_method
  end
end
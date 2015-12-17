post '/foo' do
  t = %w[text/css text/html application/javascript]
logger.debug   request.accept              # ['text/html', '*/*']
logger.debug   request.accept? 'text/xml'  # true
logger.debug   request.preferred_type(t)   # 'text/html'
logger.debug   request.body                # request body sent by the client (see below)
logger.debug   request.scheme              # "http"
logger.debug   request.script_name         # "/example"
logger.debug   request.path_info           # "/foo"
logger.debug   request.port                # 80
logger.debug   request.request_method      # "GET"
logger.debug   request.query_string        # ""
logger.debug   request.content_length      # length of request.body
logger.debug   request.media_type          # media type of request.body
logger.debug   request.host                # "example.com"
logger.debug   request.post?                # true (similar methods for other verbs)
logger.debug   request.form_data?          # false
logger.debug   request["some_param"]       # value of some_param parameter. [] is a shortcut to the params hash.
logger.debug   request.referrer            # the referrer of the client or '/'
logger.debug   request.user_agent          # user agent (used by :agent condition)
logger.debug   request.cookies             # hash of browser cookies
logger.debug   request.xhr?                # is this an ajax request?
logger.debug   request.url                 # "http://example.com/example/foo"
logger.debug   request.path                # "/example/foo"
logger.debug   request.ip                  # client IP address
logger.debug   request.secure?             # false (would be true over ssl)
logger.debug   request.forwarded?          # true (if running behind a reverse proxy)
logger.debug   request.env                 # raw env hash handed in by Rack
logger.debug   get_payload(request)
logger.debug   Nokogiri::XML(params[:xml].to_s)
end


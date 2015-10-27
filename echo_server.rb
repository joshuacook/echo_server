require 'sinatra'
require 'json'
post '/direct' do
  destination_phone_numbers = ['+13104331646','+18004377950']
  destination_phone_number = destination_phone_numbers[rand(2)]
  content_type :json
  { :destination_phone_number => destination_phone_number }.to_json
end

post '/promo' do
  destination_phone_numbers = ['+13104331646','+18004377950']
  destination_phone_number = destination_phone_numbers[rand(2)]
  content_type :json
  { :destination_phone_number => destination_phone_number }.to_json
end

post '/bundle' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  destination_campaign_ids = request_payload['ids']
  destination_campaign_id = destination_campaign_ids[rand(5)]
  content_type :json
  { :destination_campaign_id => destination_campaign_id}.to_json
end

get '/' do
  erb :index
end

post '/bundificate' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  destination_campaign_ids = request_payload['ids']
  destination_campaign_id = destination_campaign_ids[rand(5)]
  content_type :json
  { :destination_campaign_id_from_network => destination_campaign_id}.to_json
end

__END__
@@index
<% title="Advertiser landing page" %>
<!doctype html>
<html lang="en">
<head>
  <title><%= title %></title>
  <meta charset="utf-8">
</head>
<body>
  <header>
    <h1><%= title %></h1>
       <h2>Call now: <span>555-555-1234</span></h2>
    <!-- Begin Call Tracking Code -->
    <!-- Omit http from path to ensure protocol is same as current request -->
    <script src="//sfapp.testring.com/10/integration.js"></script>
    <script type="text/javascript">
     Invoca.advertiser_integration = {
      id : '26'
     };
    </script>
    <!-- End Call Tracking Code -->
  </header>
</body>
</html>

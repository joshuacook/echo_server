require 'sinatra'
require 'json'
require 'slim'

get '/' do
  slim :index
end

post '/bundle' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  destination_campaign_ids = request_payload['ids']
  destination_campaign_id = destination_campaign_ids[rand(5)]
  content_type :json
  { :destination_campaign_id => destination_campaign_id}.to_json
end

post '/bundificate' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  destination_campaign_ids = request_payload['ids']
  destination_campaign_id = destination_campaign_ids[rand(5)]
  content_type :json
  { :destination_campaign_id_from_network => destination_campaign_id}.to_json
end

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

post '/raise' do
  status 200
  body "Success.\n"
end

require 'sinatra'
require 'json'
post '/direct' do
  destination_phone_numbers = ['+13104331646','+18004377950']
  destination_phone_number = destination_phone_numbers[rand(2)]
  content_type :json
  { :destination_phone_number => destination_phone_number }.to_json
end

get '/direct' do
  destination_phone_numbers = ['+13104331646','+18004377950']
  destination_phone_number = destination_phone_numbers[rand(2)]
  content_type :json
  { :destination_phone_number => destination_phone_number }.to_json
end

get '/promo' do
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

get '/bundle' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  destination_campaign_ids = ['80','81','79','34','32']
  destination_campaign_id = destination_campaign_ids[rand(5)]
  content_type :json
  { :destination_campaign_id => destination_campaign_id}.to_json
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
 
  "#{request_payload}\n"
end


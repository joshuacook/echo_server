# encoding: utf-8
class MyApp < Sinatra::Application

  get '/real_time_routing' do
    slim :real_time_routing
  end
  
  post '/real_time_routing/bundle' do
    request.body.rewind
    request_payload = JSON.parse request.body.read
    destination_campaign_ids = request_payload['ids']
    destination_campaign_id = destination_campaign_ids.sample
    content_type :json
    { :destination_campaign_id => destination_campaign_id}.to_json
  end
  
  post '/real_time_routing/bundificate' do
    request.body.rewind
    request_payload = JSON.parse request.body.read
    destination_campaign_ids = request_payload['ids']
    destination_campaign_id = destination_campaign_ids.sample
    content_type :json
    { :destination_campaign_id_from_network => destination_campaign_id}.to_json
  end
  
  post '/real_time_routing/promo' do
    destination_phone_numbers = ['+17074437062','+19072665145','+15132411010','+12076883210']
    destination_phone_number = destination_phone_numbers.sample
    content_type :json
    { :destination_phone_number => destination_phone_number }.to_json
  end

  post '/real_time_routing/extensions' do
    destination_phone_number = '+18554474133'
    destination_phone_number = destination_phone_number + 'x,,,,' + 1.to_s
    content_type :json
    { :destination_phone_number => destination_phone_number }.to_json
  end
end

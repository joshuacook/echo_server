# encoding: utf-8
class MyApp < Sinatra::Application

  get '/real_time_routing' do
    slim :real_time_routing
  end
  
  route :get, :post, '/real_time_routing/destination_campaign_id.*' do
    ip, method, media_type = basic_request_information  
    request_payload = request_parser(media_type)
    prepend_to_hooklog_txt ip,method,media_type,request_payload
    
    destination_campaign_ids = request_payload['ids']
    destination_campaign_id = destination_campaign_ids.sample
    
    response_format = get_response_format request.path
    
    response_builder(response_format,"destination_campaign_id",destination_campaign_id,ip)
  end
  
  route :get, :post, '/real_time_routing/destination_campaign_id_from_network.*' do
    ip, method, media_type = basic_request_information  
    request_payload = request_parser(media_type)
    prepend_to_hooklog_txt ip,method,media_type,request_payload
    
    destination_campaign_ids = request_payload['ids']
    destination_campaign_id = destination_campaign_ids.sample
    
    response_format = get_response_format request.path
    
    response_builder(response_format,"destination_campaign_id_from_network",destination_campaign_id,ip)
  end

  route :get, :post, '/real_time_routing/destination_phone_number.*' do
    ip, method, media_type = basic_request_information  
    request_payload = request_parser(media_type)
    prepend_to_hooklog_txt ip,method,media_type,request_payload
    
    destination_phone_numbers = ['+17074437062','+19072665145','+15132411010','+12076883210']
    destination_phone_number = destination_phone_numbers.sample
    
    response_format = get_response_format request.path
    
    response_builder(response_format,"destination_phone_number",destination_phone_number,ip)
  end
end 
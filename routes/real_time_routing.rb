# encoding: utf-8
class MyApp < Sinatra::Application

  get '/real_time_routing' do
    slim :real_time_routing
  end
  
  post '/real_time_routing/destination_campaign_id.*' do
    ip, method = basic_request_information  
    request_format, request_payload = request_parser(request.path)
    prepend_to_hooklog_txt ip,method,request_format,request_payload
    
    destination_campaign_ids = request_payload['ids']
    destination_campaign_id = destination_campaign_ids.sample
    
    response_builder(request_payload['response_format'],"destination_campaign_id",destination_campaign_id,ip)
  end

  post '/real_time_routing/destination_campaign_id_from_network.*' do
    ip, method = basic_request_information  
    request_format, request_payload = request_parser(request.path)
    prepend_to_hooklog_txt ip,method,request_format,request_payload
    
    destination_campaign_ids = request_payload['ids']
    destination_campaign_id_from_network = destination_campaign_ids.sample
    
    response_builder(request_payload['response_format'],"destination_campaign_id_from_network",destination_campaign_id_from_network,ip)
  end

  post '/real_time_routing/destination_phone_number.*' do
    ip, method = basic_request_information  
    request_format, request_payload = request_parser(request.path)
    prepend_to_hooklog_txt ip,method,request_format,request_payload
    
    destination_phone_numbers = ['+17074437062','+19072665145','+15132411010','+12076883210']
    destination_phone_number = destination_phone_numbers.sample
    response_builder(request_payload['response_format'],"destination_phone_number",destination_phone_number,ip)
  end

  get '/real_time_routing/destination_phone_number.html' do
    ip, method = basic_request_information  
    request_format, request_payload = request_parser(request.path)
    prepend_to_hooklog_txt ip,method,request_format,request_payload
    
    destination_phone_numbers = ['+17074437062','+19072665145','+15132411010','+12076883210']
    destination_phone_number = destination_phone_numbers.sample
    response_builder(request_payload['response_format'],"destination_phone_number",destination_phone_number,ip)
  end
end 

__END__
#   post '/real_time_routing/extensions' do
#     basic_request_information  
#     request_payload = format_handler(request.path)
#      
#     destination_phone_number = '+18554474133'
#     destination_phone_number = destination_phone_number + 'x,,,,' + 1.to_s
#     content_type :json
#       { :destination_phone_number => destination_phone_number }.to_json
#   end


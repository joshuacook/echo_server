require 'sinatra'
require 'json'
get '/' do
  content_type :json
  { :destination_phone_number => "+13104331646"}, {:destination_phone_number => "+18004377950"}.to_json 
end

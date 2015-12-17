# encoding: utf-8
require 'sinatra'
require 'json'
require 'slim'
require 'logger'
require 'nokogiri'

require_relative 'routes/init'
require_relative 'lib'

class MyApp < Sinatra::Application
  enable :logging

  before do
    logger.level = Logger::DEBUG
  end
end

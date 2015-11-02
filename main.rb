# encoding: utf-8
require 'sinatra'
require 'json'
require 'slim'
require 'logger'

class MyApp < Sinatra::Application
  enable :logging

  before do
    logger.level = Logger::DEBUG
  end
end

require_relative 'routes/init'
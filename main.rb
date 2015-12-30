# encoding: utf-8
require 'sinatra'
require 'json'
require 'slim'
require 'logger'
require 'nokogiri'
require "net/http"
require "uri"
require "sinatra/multi_route"
require "sinatra/reloader" if development?

require_relative 'routes/init'
require_relative 'lib/handler'
require_relative 'lib/standard_logging'

include Handler
include StandardLogging

class MyApp < Sinatra::Application
  enable :logging

  before do
    logger.level = Logger::DEBUG
  end
end

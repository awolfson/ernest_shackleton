require 'twitter'
require './config.rb'

class TwitterAPI

  attr_reader :client

  def initialize
    @config = Config.new('twitter').values
    @client = get_client
  end

  def get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = @config['consumer_key']
      config.consumer_secret     = @config['consumer_secret']
      config.access_token        = @config['access_token']
      config.access_token_secret = @config['access_token_secret']
    end
  end
end

#!/usr/bin/env ruby

require "twitter"

client = Twitter::REST::Client.new(
  consumer_key:        "consumer_key",
  consumer_secret:     "consumer_secret", 
  access_token:        "access_token", 
  access_token_secret: "access_token_secret", 
)

client.update("#{ARGV[0]}  \n#sent_from_ruby")
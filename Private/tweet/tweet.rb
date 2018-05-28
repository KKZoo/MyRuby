#!/usr/bin/env ruby

require "twitter"

client = Twitter::REST::Client.new(
  consumer_key:        "consumer_key", # <= ここに取得したconsumer_keyを入れる
  consumer_secret:     "consumer_secret", # <= ここに取得したconsumer_secretを入れる
  access_token:        "access_token", # <= ここに取得したaccess_tokenを入れる
  access_token_secret: "access_token_secret", # <= ここに取得したaccess_token_secretを入れる
)

client.update("#{ARGV[0]}  \n#sent_from_ruby")
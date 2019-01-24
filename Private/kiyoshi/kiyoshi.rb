#!/bin/env ruby

zundoko = []
num = 0

# ズンドコ節をランダムに生成
(0...5).each do |i|
  #zundoko << rand(3) # 乱数生成
  zundoko << ARGV[i].to_i
 
  if zundoko[i] == 0 then
    p "ズン"
  else
    p "ドコ"
    num += 2**i
  end
end

# 判定部分
if num == 16 then
  p "キ・ヨ・シ!!😆"
else
  p "キヨシできませんでした😰"
end

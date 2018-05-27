#!/bin/env ruby

zundoko = []
num = 0

# ズンドコ節をランダムに生成
for i in 0...5
   #zundoko << rand(3) #乱数生成
   zundoko << ARGV[i].to_i

    if zundoko[i] == 0 then
         p "ズン"
    else
         p "ドコ"
         num += 2**i #[0,0,0,0,1]と考えた場合 => 2^4 = 16でユニーク化できるはず？
    end
end

#判定部分
if num == 16 then
   p "キ・ヨ・シ!!😆"
else
   p "キヨシできませんでした😰"
end

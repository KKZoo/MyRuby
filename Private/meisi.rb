=begin
	名刺の問題
=end

#入力 => $N M
in_NM = gets.split(" ")

#カード対する加減算の数値を作成
i = in_NM[0].to_i
num = Array.new

i.times do | i |
	num<< 2*in_NM[0].to_i - (2*i + 1)
end

#上記で作成したものの中から数値を選ぶための計算
num_diff = in_NM[1].to_i % in_NM[0].to_i

#page判別 及び裏側のカードを出力
if ((in_NM[1].to_i - 1) / in_NM[0].to_i) % 2 == 0 then
	puts in_NM[1].to_i + num[num_diff - 1]
else
	num = num.sort
	puts in_NM[1].to_i - num[num_diff - 1]
end

=begin
	配列の中身を反転するプログラム
=end

#元になる配列を作成
array = Array.new
result = Array.new

num = rand(10)+1
puts num

num.times do
	array << rand(100)
end

p array

#中身を反転するコード
i = 0
array.each do
	result[num-1] = array[i]
	
	num -= 1
	i += 1
end

p result

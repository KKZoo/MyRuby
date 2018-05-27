=begin
デバッグ用プログラム
=end

binary = 0

32.times do
	binary.to_s(2)
	p `ruby kiyoshi.rb #{binary[4]} #{binary[3]} #{binary[2]} #{binary[1]} #{binary[0]}`
	binary += 1
end
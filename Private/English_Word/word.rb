=begin
　英単語を出力するプログラム
	usage => ruby word.rb mode data_name    =>  exam)  ruby word.rb r data
　output => "EnglishWord\n"
　input   => JapanesMean
	output => Answer
=end

if ARGV[0] != "i" and ARGV[0] != "r"
	puts "usage => ruby word.rb [mode] [data_name]"
	exit
end

word = Array.new
data_name = ARGV[1]

File.open("./Word_Data/#{data_name}.txt") do |file|
	file.each_line do |data|
		 word << data.chomp.split(" ")
	end
end


#順番通りに出力
if ARGV[0] == "i"
	(0...word.size).each do |n|
		puts word[n][0]
		ans = STDIN.gets.chomp
		if ans == word[n][1] then
			puts "正解です"
			puts "--------------------------------"
			puts "\n"
		else
			puts "答えは「#{word[n][1]}」です"
			puts "--------------------------------"
			puts "\n"
		end
	end
elsif ARGV[0] == "r"
	#ランダムに出力
	ran = (0...word.size).to_a.sort_by{rand}
	(0...word.size).each do |x|
		puts word[ ran[x] ][0]
		ans = STDIN.gets.chomp
		if ans == word[ ran[x] ][1] then
			puts "正解です"
			puts "--------------------------------"
			puts "\n"
		else
			puts "答えは「#{word[ ran[x] ][1]}」です"
			puts "--------------------------------"
			puts "\n"
		end
	end
end
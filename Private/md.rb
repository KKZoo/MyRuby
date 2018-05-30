#!/usr/bin/env ruby

=begin
mark down の有無を確認し、そのファイルが存在するならファイルを展開。
ファイルが存在しないならファイルを作成後、展開する。
=end

name = ARGV[0]

#mark downの有無を確認
if File.exist?("#{ARGV[0]}.md") == true then
#mark downを展開
	`open -a CotEditor #{name}.md`
	`open #{name}.md`
else
#mark downを作成及び展開
	File.open("./#{name}.md","w").close()
	`open -a CotEditor #{name}.md`
	`open #{name}.md`
end
=begin
タイピングゲーム (プロ２仕様~ruby ver~)
=end

class Typing

    def main
        answer = rand_ans
        match_num = 0

#answerとなる文字列 及び ユーザ入力を促す文
        puts "以下の文字を入力してね"
        puts answer

        print "=>"
        input = gets

#読み込んだinput文字数
        lensize = input.length
        puts "貴方の入力文字数: #{lensize -= 1}" #0からカウントで\nの２文字分を引いたため -1 をした

#match_num（一致した文字数）
        for i in 0..lensize do
            if input[i] == answer[i] then
                match_num += 1
            end
        end

        puts "一致した文字数: #{match_num}"

#mismatch_num（不一致した文字数）
        if answer.length < lensize then
            puts "不一致した文字数: #{mismatch_num = lensize - match_num}"
        else
            puts "不一致した文字数: #{mismatch_num = answer.length - match_num}"
        end

#一致率
        match_rate = match_num.to_f / (match_num.to_f + mismatch_num.to_f)
        puts "貴方の一致率: #{match_rate.round(4) * 100}%"
    end

#rand_ans（answerの値を作る）=> 自作関数
    def rand_ans
        out =  []
        text = [*('0'..'9'), *('a'..'z'), *('A'..'Z')]
        i = rand(7) + 1

        for i in 1..i do
            out << text[rand(61)]
        end
        out.join
    end
end

Typing.new.main
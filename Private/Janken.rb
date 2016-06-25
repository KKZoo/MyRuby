#! /usr/bin/evn ruby

=begin
     じゃんけんプログラム！
=end

require 'scanf'

class Janken

def Janken_Main

# memory.txt を削除
delete

# memory.txt を作成
create

#繰り返し処理
   for e in 1..ARGV[0].to_i

tes=[]
i = rand(0..2)

#入力処理
    puts "✊　＝0  , ✌️　＝1  ,✋　＝2　を入力ください"
    tes = scanf("%d")
    tes = tes[0]

#CPU入力の分岐処理
    if i == 0 then   #CPU=✊の場合の処理
       gu
       case tes
           when 0 then
                puts "あいこだよ!!"
                `echo "0">>./memory.txt`
           when 1 then
                puts "負けだよ!!"
                `echo "-1">>./memory.txt`
           when 2 then
                puts "勝ちだよ!!"
                `echo "1">>./memory.txt`
           else
                puts "error じゃ"
                `echo "0">>./memory.txt`
       end

    elsif i == 1 then   #CPU=✌️の場合の処理
       tyoki
       case tes
           when 0 then
                puts "勝ちだよ!!"
                `echo "1">>./memory.txt`
           when 1 then
                puts "あいこだよ!!"
                `echo "0">>./memory.txt`
           when 2 then
                puts "負けだよ!!"
                `echo "-1">>./memory.txt`
           else
                puts "error じゃ"
                `echo "0">>./memory.txt`
       end

    elsif i ==2 then     #CPU=✋の場合の処理
       pa
       case tes
           when 0 then
                puts "負けだよ!!"
                `echo "-1">>./memory.txt`
           when 1 then
                puts "勝ちだよ!!"
                `echo "1">>./memory.txt`
           when 2 then
                puts "あいこだよ!!"
                `echo "0">>./memory.txt`
           else
                puts "error じゃ"
                `echo "0">>./memory.txt`
       end
    else
       puts "error"
    end

   end

#結果を通知
result
puts "\n"
puts "#{ (@result*100).round(2) }%の勝率"
puts "\n"

end  #def main 終了

   def gu
#グー
       puts "CPUはグー！"
       puts "　　　　　 ＿_"
       puts "　　　　　/｣｣｣｣"
       puts "　　　　 ｜っ丿"
       puts "　 ∧_∧ 　/ ／"
       puts "　( ･ω･)／"
       puts "　(つ　ﾉ"
       puts "　 ｕ-ｕ"
   end

#チョキ
   def tyoki
       puts "CPUはチョキ！"
       puts "　　　　　(Ｖ)"
       puts "　　　　　/ｱE)"
       puts "　 ∧_∧　 / ／"
       puts "　( ･ω･)／"
       puts "　(つ　ﾉ"
       puts "　 ｕ-ｕ"
   end

#パー
   def pa
      puts "CPUはパー！"
      puts "　　　　　｢｢｢h"
      puts "　　　　 Ｃ　ﾉ"
      puts "　 ∧_∧　 / ／"
      puts "　( ･ω･)／"
      puts "  (つ　ﾉ"
      puts "　 ｕ-ｕ"
   end

# memory.txtを作成
   def create
      `touch ./memory.txt`
   end

# memory.txtを削除
   def delete
     data="./memory.txt"
     if File.file?(data) then
        File.unlink data
     end
   end

# resultを計算
   def  result
    data1=[] , k = 0
    tmp_win = [] ,tmp_draw = [] , tmp_lose = []

    file = open("./memory.txt")
        data = file.readlines #1行ずつデータを取り出す処理

#試合の勝ち負けを解析
           data.each do |line|
                tmp_win << 0 if(data[k].to_i==1)
                tmp_lose << 0 if(data[k].to_i==-1)
                tmp_draw << 0 if(data[k].to_i==0)
                k +=1
           end

#勝率の計算 => 勝率 = 勝数 / (勝数 + 負数)  としている
           @result = tmp_win.count.to_f / ( tmp_win.count + tmp_lose.count).to_f
    file.close
   end

end

#全体の実行
Janken.new.Janken_Main
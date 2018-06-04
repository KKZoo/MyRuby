=begin
    家計簿プログラム
=end

#データの読み込み
    j=1
    k=0
    tmp_all = Array.new
    tmp_one = Array.new
    tmp_two = Array.new
    tmp_three = Array.new
    tmp_four = Array.new
    
    file = open("./data/2018/test.txt")
        data = file.readlines
        (data.size).times do
           data[data.size - j] = data[data.size - j].split(" ")
            j += 1
        end

#データの種類を分別
           data.each do |line|
                tmp_all << data[k][2].to_i
                tmp_one << data[k][2].to_i if(data[k][3].to_i == 1)
                tmp_two << data[k][2].to_i if(data[k][3].to_i == 2)
                tmp_three << data[k][2].to_i if(data[k][3].to_i == 3)
                tmp_four << data[k][2].to_i if(data[k][3].to_i == 4)
                k +=1
           end
    file.close    

#p [tmp_all, tmp_one, tmp_two, tmp_three, tmp_four]

#データの計算
#全体の計算    
    n = 1
    total_all = 0
    (tmp_all.size).times do
        total_all += tmp_all[ tmp_all.size - n ]
        n += 1
    end

#固定費の計算
    n = 1
    total_one = 0
    (tmp_one.size).times do
        total_one += tmp_one[ tmp_one.size - n ]
        n += 1
    end

#必要経費の計算  
    n = 1
    total_two = 0  
    (tmp_two.size).times do
        total_two += tmp_two[ tmp_two.size - n ]
        n += 1
    end

#浪費の計算    
    n = 1
    total_three = 0
    (tmp_three.size).times do
        total_three += tmp_three[ tmp_three.size - n ]
        n += 1
    end
    
#特別経費の計算
    n = 1
    total_four = 0
   (tmp_four.size).times do
        total_four += tmp_four[ tmp_four.size - n ]
        n += 1
   end

#`echo "#{total_one}" >> ./data/output/text.txt`
#`echo "#{total_two}" >> ./data/output/text.txt`
#`echo "#{total_three}" >> ./data/output/text.txt`
#`echo "#{total_four}" >> ./data/output/text.txt`
#`echo "#{total_all}" >> ./data/output/text.txt`

#p [total_all, total_one, total_two, total_three, total_four]
 
#テキストデータからデータを入力
open("./data/output/text.txt","a")#{|f| f.write jikken}

#gnuplotにデータを投げている
f=open "| gnuplot - -","w"
f.print <<Gp
set term jpeg
set xrange [3:8]
set xlabel "month"
set ylabel "money"
set output "kakebo.jpeg"
plot "./data/output/text.txt" with lines title "all" , "./data/output/text1.txt" with lines title "1", "./data/output/text2.txt" with lines title "2" ,"./data/output/text3.txt" with lines title "3", "./data/output/text4.txt" with lines title "4"
Gp
f.close
    
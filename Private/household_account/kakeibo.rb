=begin
    家計簿プログラム
=end

#データの読み込み
    tmp_total = Array.new
    tmp_one = Array.new
    tmp_two = Array.new
    tmp_three = Array.new
    tmp_four = Array.new
    j=1
    k=0
    
    file = open("./data/2018/test.txt")
        data = file.readlines
        (data.size).times do
         p  data[data.size - j] = data[data.size - j].split(" ")
            j += 1
        end

#データの種類を分別
           data.each do |line|
                tmp_total << data[k][2].to_i
                tmp_one << data[k][2].to_i if(data[k][3].to_i == 1)
                tmp_two << data[k][2].to_i if(data[k][3].to_i == 2)
                tmp_three << data[k][2].to_i if(data[k][3].to_i == 3)
                tmp_four << data[k][2].to_i if(data[k][3].to_i == 4)
                k +=1
           end
    file.close
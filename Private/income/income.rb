=begin
    収入を出力するプログラム
=end

def main

    year = ARGV[0]
    month = ARGV[1]
    hourly_wage = ARGV[2]

#データの読み込み
    j=1

    file = open("./data/#{year}/#{month}.txt")
    data = file.readlines
    (data.size).times do
       data[data.size - j] = data[data.size - j].split(" ")
        j += 1
    end

#勤務時間の計算    
    work_hours = 0
    income = 0
    (data.size).times do |k|
          work_hours += data[k][2].to_f - data[k][1].to_f
          work_hours -= 1 if data[k][2].to_f - data[k][1].to_f > 6
    end

#収入の計算
    income += work_hours * hourly_wage.to_f
    puts income.round(2)
end

main
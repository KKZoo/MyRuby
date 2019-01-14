
#  家計簿プログラム

def main
  # 過去データの削除
  delete

  # calをtxt数分、繰り返す
  Dir.glob("./data/#{ARGV[0]}/*.txt").count.times do |month|
    cal(ARGV[0], month)
  end

  # 最終出力
  plot
end

### 各月ごとの支出を計算
def cal(year, month)
  # データの読み込み
  j = 1
  k = 0
  tmp_all = []
  tmp_one = []
  tmp_two = []
  tmp_three = []
  tmp_four = []
  total_result = []

  file = open("./data/#{year}/#{month}.txt")
    data = file.readlines
    data.size.times do
      data[data.size - j] = data[data.size - j].split(' ')
      j += 1
    end
  
    # データの種類を分別
    data.each do |line|
      tmp_all << data[k][2].to_i
      tmp_one << data[k][2].to_i if data[k][3].to_i == 1
      tmp_two << data[k][2].to_i if data[k][3].to_i == 2
      tmp_three << data[k][2].to_i if data[k][3].to_i == 3
      tmp_four << data[k][2].to_i if data[k][3].to_i == 4
      k += 1
    end
  file.close
  tmp_summary = [tmp_all, tmp_one, tmp_two, tmp_three, tmp_four]

# 計算部分  
    (tmp_summary.size).times do |summary|
      total = 0   
      (tmp_summary[summary].size).times do |tmp|
        total += tmp_summary[summary][tmp]
      end
      total_result << total
    end

  # 外部ファイルにデータを出力
  File.open("./data/output/Spending.txt", "a") do |output_data|
    output_data.puts("#{month} #{total_result[1]} #{total_result[2]} #{total_result[3]} #{total_result[4]}")
  end
end

def plot
# gnuplotにデータを投げている
f = open '| gnuplot - -', 'w'
f.print <<Gp
set style fill solid border lc rgb "black"
set boxwidth 0.5
set term jpeg
set xrange [1:12]
set xlabel "month"
set ylabel "money"
set output "kakebo.jpeg"
plot "./data/output/Spending.txt" using 0:($2+$3+$4+$5) with boxes lw 2 lc rgb "pink" title "spacial", "./data/output/Spending.txt" using 0:($2+$3+$4) with boxes lw 2 lc rgb "green" title "waste", "./data/output/Spending.txt" using 0:($2+$3) with boxes lw 2 lc rgb "orange" title "nessesary", "./data/output/Spending.txt" using 0:($2):xtic(1) with boxes lw 2 lc rgb "light-cyan"  title "fixed"
Gp
f.close

# 画像データの出力
`open kakebo.jpeg`
end

# txtを削除
def delete
  data = './data/output/Spending.txt'
  File.unlink data if File.file?(data)
end

main
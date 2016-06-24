#! /usr/bin/evn ruby

=begin
  シンプレックス法 - (解なし)
引用元の機能に今回の課題に必要な機能を付け加えたコード
追加機能
     (1) 計算過程のタブロー表示
     (2) 解の有無を確認(なければループを抜ける)

引用元
  http://www.mk-mode.com/octopress/2014/02/22/ruby-linear-programming-simplex/
=end


# 計算クラス
class Calc
  # 定数
  N_ROW = 4  # 行数
  N_COL = 6  # 列数
  N_VAR = 5  # 変数の数

  def initialize
    # 係数行列
    @a = [
      [ 1.0,  -1.0,  1.0,  0.0,  0.0,  1.0],
      [ -2.0,  1.0,  0.0,  1.0,  0.0,  2.0],
      [ 1.0,  -2.0,  0.0,  0.0,  1.0,  1.0],
      [-1.0, -1.0,  0.0,  0.0,  0.0,  0.0]
    ]
  end

  # 線形計画法
  def calc_linear_programming

    loop do

     #計算過程のタブローを出力 [x0,x1, ... ,定数]
      (0...N_ROW).each do |k|
         p @a[k]
      end
      print "\n"

      # 列選択
      min, y = select_col(9999)
      break if min >= 0

      # 行選択
      min, x = select_row(9999, y)


     #解の有無を確認
      (0...N_ROW).each do |i|
         if @a[i][y] < 0 then
            @b = 0
         else
            break
         end
         if @b == 0 then
            @b = "解なし"
         end
      end
      break if(@b == "解なし")


      # ピボット係数を p で除算
      divide_pibot_var(x, y)

      # ピボット列の掃き出し
      sweap_out(x, y)

    end

    # 結果出力
    puts @b if(@b == "解なし")
    display  if(@b != "解なし" )
  end

  private

  # 列選択
  def select_col(min)
    y = 0
    0.upto(N_COL - 2) do |k|
      if @a[N_ROW - 1][k] < min
        min = @a[N_ROW - 1][k] #その時のPEの列の|定数|の最大値
        y   = k
      end
    end

    return [min, y]
  end

  # 行選択
  def select_row(min, y)
    x = 0
    0.upto(N_ROW - 2) do |k|
      p = @a[k][N_COL - 1] / @a[k][y].to_f
      if @a[k][y] > 0 && p < min
        min = p # その時のPEの行の定数
        x   = k
      end
    end

    return [min, x]
  end

  # ピボット係数を p で除算
  def divide_pibot_var(x, y)
    p = @a[x][y]
    0.upto(N_COL - 1) { |k| @a[x][k] = @a[x][k] / p.to_f }
  end

  # ピボット掃き出し
  def sweap_out(x, y)
    0.upto(N_ROW - 1) do |k|
      unless k == x
        d = @a[k][y]
        0.upto(N_COL - 1) { |j| @a[k][j] -= d * @a[x][j] }
      end
    end
  end

  # 結果出力
  def display
    0.upto(N_VAR - 1) do |k|
      flag = -1
      0.upto(N_ROW - 1) { |j| flag = j if @a[j][k] == 1 }
      printf("x%d = %8.4f\n", k, flag == -1 ? 0.0 : @a[flag][N_COL - 1])
    end
    printf("z  = %8.4f\n", @a[N_ROW - 1][N_COL - 1])
  end
end

# インスタンス化＆実行
Calc.new.calc_linear_programming
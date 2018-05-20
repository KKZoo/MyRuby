#! /usr/bin/evn ruby

# 行列ライブラリの読込
require 'matrix'

=begin
   (2) n元1次方程式のプログラム
   usage  =>  ruby equation.rb n = integer number
   4次元配列ex => ruby equation.rb 4
=end

#n元のnを引数にて設定
n = ARGV[0]
n = n.to_i
a , vector = [] , []

#ランダムでn本の１次関数を作成
for i in 0...n
    matrix = []
       for j in 0...n
            matrix << rand(-9..9)
       end
    a[i] = matrix
    vector << rand(-50..50)
end

#n本の１次関数を行列化
p a = Matrix.columns(a)
p b = Vector.elements(vector)

# A^(-1) * bをしている.
puts a.inv*b

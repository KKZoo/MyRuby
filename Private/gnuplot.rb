#!ruby
# coding: utf-8

=begin
   gnuplotで図を出力プログラム
   ※これは一般化していないので使う際には注意が必要!!
=end

jikken=`ruby ave.rb`
open("plot_ave.txt","a"){|f| f.write jikken}

f=open "| gnuplot - -","w"
f.print <<Gp
set term pdf
set xlabel "iterations"
set ylabel "errors"
set output "level1_ave.pdf"
plot "plot_ave.txt" with lines title "avereage"
Gp
f.close

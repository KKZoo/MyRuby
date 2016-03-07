#!/usr/bin/ruby
# coding: utf-8

#データを出力する処理
def data
#希望している出力データを配列に格納
    fieldB=["AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN"]
    fieldC=["male","female"]

#データを出力する
    for i in 0..9999999 do
        random = rand(30000)
        random2 = rand(14)
        random3 = rand(2)
        puts one="#{random},#{fieldB[random2]},#{fieldC[random3]}"
        i += 1
    end
end

data
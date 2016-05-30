#! /usr/bin/evn ruby

=begin
	α1の欲張り法プログラム(6)-1
=end

def main
    a = [3,6,5,4,8,5,3,4]
    b , d = 25 ,0
    c = [7,12,9,7,13,8,4,5]
    i = 7
    memo1 , memo2 , memo3 = 0 , 0 , []
    stack1,stack2 = Array.new() , Array.new()

#各々の重みを 重み = 重量 / 価格 で求めている
    for j in 0..i
        d = c[j].to_f / a[j].to_f
        stack1 << d.round(3)
        stack2[j] = [stack1[j] , a[j] , c[j]]
    end

#降順(逆順)にソート
    stack2.sort! {|a, b| -(a <=> b)}

    for k in 0..i
        if memo1 <= b then
           memo1 += stack2[k][1]
           memo2 += stack2[k][2]

#上記の計算でオーバーしてしまった際にその１回分を戻す処理
           if memo1 > b then
               memo1 -= stack2[k][1]
               memo2 -= stack2[k][2]
               memo3 << 0
           elsif memo1 <= b then
               memo3 << 1
           end

        end
    end

p memo3
print "最適解の[重量A,価格C]は[#{memo1},#{memo2}]です。\n"

end 

main
#! /usr/bin/evn ruby

=begin 
	α1の総当たり法 プログラム (3)
=end

def main
#  格納領域を作成
    a = [3,6,5,4,8,5,3,4]
    b = 25
    c = [7,12,9,7,13,8,4,5]
    i = 7
    x = [0,0,0,0,0,0,0,0]
    x1 , x2 = 0b00000000 , [0]
    stack1,stack2,stack3 = [],[],[]
    tmp = []

    for k in 0..255
       x1 = x1 + 0b1

    #各桁をとりだしている
        for j in 0..i
          x[j] = (x1.to_s(2).to_i(10)/10**j) % 10
        end

    #stack1にはaのstack2にはcのデータの総当たりで求めた加算結果を格納

    tmp = x
    x -= x2
    y = x.length

        if  6 >= y && y >= 4 then
              memo,memo2 = 0,0
            for e in 0..i
               memo += a[e]*tmp[e]
               memo2 += c[e]*tmp[e]
            end
               stack1 << memo
               stack2 << memo2
               stack3 << tmp
        end

    end

    #stack1,2をstackに格納+ソートを行ってstack_finにまとめている。
    stack = Array.new()
    stack = [stack1,stack2,stack3]
    stack_fin = stack.transpose.sort { |a, b| b[1] <=> a[1] }

    #stack_finから最適解を見つけ出し出力
    for m in 0..stack_fin.count
       if stack_fin[m][0] <= b then
          print "最適解は#{stack_fin[m][2]}\n"
          print "最適解の[重量A,価格C]は[#{stack_fin[m][0]},#{stack_fin[m][1]}]です。\n"
          break
       end
    end

end

main
# FizzBuzz問題
(1..30).each do |n|
 if n%15 == 0 then
   puts "FizzBuzz"
 elsif  n%3 == 0 then
   puts "Fizz"
 elsif n%5 == 0 then
   puts "Buzz"
 else
   puts n
 end
end
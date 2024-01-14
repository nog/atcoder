N = gets.to_i
X = gets.split.map(&:to_i).sort
minus = X.find_all{|x| x < 0}
plus = X.find_all{|x| x > 0}
if(minus.size > 6)
  minus = minus[0..2] + minus[-3..-1]
end
if(plus.size > 6)
  plus = plus[0..2] + plus[-3..-1]
end

min = 9999999999999999
max = - 9999999999999

(minus+plus).combination(3).each do |a,b,c|
  r = Rational(a+b+c, a*b*c)
  min = r if r < min
  max = r if max < r
end

puts min.to_f
puts max.to_f
P = gets.to_i

list = [0]

a = 1
1.upto(P) do |i|
  a = a * i
  list.push(a)
  break if a >= P
end


result = 0
nokori = P

list.reverse.each do |x|
  result += nokori / x
  nokori = nokori % x
  if nokori == 0
    break
  end
end

puts result
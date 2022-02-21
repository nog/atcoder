N = gets.to_i
S = gets.chomp.split('')

b = nil
count = 0
list = []
S.each do |s|
  if s == b
    count += 1
  else
    list.push(count + 1) if count > 0
    count = 0
  end
  b = s
end
list.push(count + 1) if count > 0

result = 0
list.each do |x|
  result += x * ( x - 1 ) / 2
end

puts result
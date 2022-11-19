N = gets.to_i
A = gets.split.map(&:to_i)
MAX = N
list = []
stock = 0
A.sort.each do |a|
  if a > MAX || list[-1] == a
    stock += 1
  else
    list.push(a)
  end
end

1.upto(MAX) do |i|
  if list[0] == i
    list.shift
    next
  elsif stock >= 2
    stock -= 2
    next
  elsif stock  >= 1 && list.size >= 1
    stock -= 1
    list.pop
    next
  elsif list.size >= 2
    list.pop
    list.pop
    next
  else
    puts i - 1
    exit
  end
end

puts N
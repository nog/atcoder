n = gets.to_i
a = gets.split.map(&:to_i)

if n == 0
  if a[0] == 1
    puts 1
  else
    puts -1
  end
  exit
end

if a[0] != 0
  puts -1
  exit
end

# x = [1]
# result = 1
# 1.upto(n-1) do |i|
#   nodes = a[i] + (a[i+1]+1) /2
#   if nodes > 2 * (x[i-1] - a[i-1])
#     puts -1
#     exit
#   end
#   x.push(nodes)
#   result += nodes
# end
# 
# if a[n] > 2 * (x[n-1] - a[n-1])
#   puts -1
#   exit
# end
# 
# result += a[n]
# puts result

max = 2**n
if a[n] > max
  puts -1
  exit
end

x = Array.new(n+1)
x[n] = a[n]
x[0] = 1

(n-1).downto(1) do |i|
  max = max / 2
  _max = max - (a[i-1] * 2)
  if a[i] == 0
    if x[i+1] < _max
      x[i] = x[i+1]
      next
    else
      x[i] = _max
    end
  elsif a[i] + x[i+1] > _max
    if a[i] > _max
      puts -1
      exit
    end
    x[i] = _max
  else
    x[i] = x[i+1] + a[i]
  end
end

warn x.inspect
result = 1
1.upto(n-1) do |i|
  if x[i] > (x[i-1] - a[i-1]) * 2
    x[i] = (x[i-1] - a[i-1]) * 2
  end
  result += x[i]
end

if x[n] > (x[n-1] - a[n-1]) * 2
  puts -1
  exit
end
result += x[n]
warn x.inspect
puts result
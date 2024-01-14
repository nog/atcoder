N = gets.to_i
A = gets.split.map(&:to_i).sort

def f x
  r = 0
  while(x > 0) do
    r += x % 10
    x /= 10
  end
  r
end
result = 0
A.each do |a|
  result += 2 * f(a)
end
puts result
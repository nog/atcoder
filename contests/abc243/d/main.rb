N, X = gets.split.map(&:to_i)
S = gets.chomp.split('')
x = X
stack = []
while(x != 1) do
  if x.odd?
    stack.unshift('R')
  else
    stack.unshift('L')
  end
  x /= 2
end

N.times do |i|
  s = S[i]
  if s == 'U'
    stack.pop
  elsif s == 'L'
    stack.push(s)
  elsif s == 'R'
    stack.push(s)
  else
    raise
  end
end

res = 1
stack.each do |s|
  if s == 'L'
    res *= 2
  else
    res = res * 2 + 1
  end
end
puts res
N = gets.to_i
S = gets.chomp
s = S.gsub('A', 'BB').split('')
result = []

while(x = s.shift) do
  if x == 'B' && s[0] == 'B'
    s.shift
    result.push('A')
  else
    result.push(x)
  end
end

puts result.join('')
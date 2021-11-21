N, K = gets.split.map(&:to_i)

S = Array.new N
N.times do |i|
  S[i] = gets.chomp
end
S.sort!

k = K

result = []

while(k>1) do
  a = S.shift
  b = S.shift
  if a.length >= b.length
    result.push(a)
    S.unshift(b)
    k -= 1
    next
  end

end

result.push S[0]
puts result.join('')
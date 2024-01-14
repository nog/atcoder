N, A, B = gets.split.map(&:to_i)
S = gets.chomp.split('')

result = N * B

a = 0
s = S + S

max = N / 2
base = 0
while(a<N) do 
  cnt = 0
  max.times do |i|
    if s[a+i] != s[a+N-1-i]
      cnt += 1
    end
  end
  r = base + cnt * B
  result = r if result > r
  a += 1
  base += A
  break if result <= base
end

puts result
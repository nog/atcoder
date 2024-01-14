N, K = gets.split.map(&:to_i)
S = gets.chomp.split('')

xcount = S.count('X')
if xcount == K
  puts N - 1
  exit
elsif xcount == N
  if K <= 1
    puts 0
    exit
  else
    puts K -1
    exit
  end
elsif xcount < K
  k = K - xcount
  res = N - 1

  list = S.join('').scan(/Y+/).map{|s| s.length }
  # warn "list!:#{list}"
  if S[0] == 'Y'
    cnt = list.shift
    if cnt < k
      k -= cnt
      res -= cnt
    else
      puts res - k
      exit
    end
  end
  if S[-1] == 'Y'
    cnt = list.pop
    if cnt < k
      k -= cnt
      res -= cnt
    else
      puts res - k
      exit
    end
  end
  list.sort!
  list.reverse!
  while(k > 0) do
    c = list.shift
    if k > c
      k -= c
      res -= (c + 1)
    else
      res -= k + 1
      k = 0
    end
  end
  puts res
  exit
end

res = 0
S.join('').scan(/YY+/).each do |s|
  res += s.length - 1
end

if K == 0
  puts res
  exit
end


list = S.join('').scan(/X+/).map{|s| s.length }
# warn "S[0]:#{S[0]} S[-1]:#{S[-1]} S: #{S}"
list.shift if S[0] == 'X'
list.pop if S[-1] == 'X'

list.sort!
k = K
while(k > 0 && list[0] && list[0] <= k) do
  c = list.shift
  k -= c
  res += c + 1
end
puts res + k

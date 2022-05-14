N = gets.to_i
AY, AX = gets.split.map(&:to_i).map{|a| a - 1}
BY, BX = gets.split.map(&:to_i).map{|b| b - 1}

S = []
N.times do |i|
  S.push(*gets.chomp.split('').map{|s| (s == '#') ? -2 : -1 })
end
MAX = (N*N) -1

S[N*AY+AX] = 0
queue = [[N*AY+AX, 1]]
require 'pp'
# warn S.each_slice(N).to_a.pretty_inspect
while(pos, c = queue.shift) do
  po = pos
  d = -N-1
  while(true) do
    break if po % N == 0
    po += d
    break if po < 0
    s = S[po]
    break if s == -2
    if s == -1
      S[po] = c
      queue.push([po, c+1])
    elsif s < c
      break
    end
  end

  po = pos
  d = -N+1
  while(true) do
    break if po % N == N-1
    po += d
    break if po < 0
    s = S[po]
    break if s == -2
    if s == -1
      S[po] = c
      queue.push([po, c+1])
    elsif s < c
      break
    end
  end

  po = pos
  d = N-1
  while(true) do
    break if po % N == 0
    po += d
    break if po > MAX
    s = S[po]
    break if s == -2
    if s == -1
      S[po] = c
      queue.push([po, c+1])
    elsif s < c
      break
    end
  end

  po = pos
  d = N+1
  while(true) do
    break if po % N == N-1
    po += d 
    break if po > MAX
    s = S[po]
    break if s == -2
    if s == -1
      S[po] = c
      queue.push([po, c+1])
    elsif s < c
      break
    end
  end
end

# warn S.each_slice(N).to_a.pretty_inspect

puts S[N*BY+BX] || -1
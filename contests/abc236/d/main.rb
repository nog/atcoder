N = gets.to_i
N2 = 2 * N
A  = Array.new(N2 - 1)

(N2 - 1).times do |i|
  A[i] = ([nil] * (i+1)) + gets.split.map(&:to_i)
end

def find stat, score, a
  return score if stat == 0
  result = 0
  while(true) do
    break if stat[a] == 1
    a += 1
  end
  na = b = a + 1
  ca = A[a]
  nstat = stat^(1<<a)
  while(b<N2) do
    if stat[b] == 1
      res = find(nstat^(1<<b), score^ca[b], na) 
      result = res if result < res
    end
    b += 1
  end
  result
end

puts find 2**(2*N)-1, 0, 0
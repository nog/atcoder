N = gets.to_i
C = gets.split.map(&:to_i)

minc = C.min
keta = N / minc

minci = 8
while(C[minci] != minc) do
  minci -= 1
end

results = [minci+1] * keta

n = N - (minc * keta)
while(results[0] == (minci + 1)) do
  x = results.shift
  n += C[x-1]
  nx = nil
  8.downto(x-1) do |i|
    c = C[i]
    next if c > n
    nx = i + 1
    break
  end
  unless nx
    results.push(x)
    break
  end
  results.push(nx)
  n -= C[nx-1]
  break if nx == x
end

puts results.sort.reverse.join('')
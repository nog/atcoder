N, M = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)
list = P.dup
result = 0
N.times do |i|
  while(list[i] > N - 1) do
    x = list[i]
    list[i] = list[x-1]
    list[x-1] = x
    result += 1
  end
end

N.upto(N+M-1) do |i|
  while(list[i] < N) do
    x = list[i]
    list[i] = list[x-1]
    list[x-1] = x
    result += 1
  end
end
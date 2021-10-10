N, M = gets.split.map(&:to_i)
S = gets.split.map(&:to_i)
T = gets.split.map(&:to_i)

cursor = 0
current = S[cursor]

cost = 1
while(cost <= (N / 2)) do
  if (S[cost] != current) || (S[-cost] != current)
    break
  end
  cost += 1
end

if(S[cost%N] == current && S[-cost%N] == current)
  if T.all?{|t| t == current }
    puts N
  else
    puts -1
  end
  exit
end

result = 0
T.each do |t|
  if t == current
    result += 1
  else
    result += cost + 1
    cost = 1
    current = t
  end
end

puts result
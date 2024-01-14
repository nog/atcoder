N, L = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
A.unshift(0)
A.push(L)

sum = L
over = nil
minus = nil

i = 1
j = N
while(i <= N && j >= 0) do
  if sum >= L
    sum -= A[i] - A[i-1]
    i += 1
  else
    sum += A[j+1] - A[j]
    j -= 1
  end
  # warn "sum:#{sum} i:#{i} j:#{j}"
  if sum == L
    puts 2 * L
    exit
  elsif sum > L
    over ||= sum
    over = sum if sum < over
  else
    minus ||= sum
    minus = sum if sum > minus
  end
end
# warn "---"
i = 1
j = N
sum = L
# warn "s sum:#{sum} i:#{i} j:#{j}"
# warn A.inspect
while(i <= N && j >= 0) do
  if sum >= L
    sum -= A[j+1] - A[j]
    j -= 1
  else
    sum += A[i] - A[i-1]
    i += 1
  end
  # warn "sum:#{sum} i:#{i} j:#{j}"
  if sum == L
    puts 2 * L
    exit
  elsif sum > L
    over ||= sum
    over = sum if sum < over
  else
    minus ||= sum
    minus = sum if sum > minus
  end
end

# warn "over:#{over} minus:#{minus}"
results = []
if minus
  results.push(2 * (2 * L - minus))
end

if over
  results.push(2 * over)
end

puts results.min
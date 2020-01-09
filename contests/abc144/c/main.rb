require 'prime'
N = gets.to_i

result = N+1
1.upto(Math.sqrt(N).to_i) do |i|
  next if N % i > 0
  if i + (N / i) < result
    result = i+(N/i)
  end
end
puts result - 2
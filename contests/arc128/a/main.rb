N = gets.to_i
A = gets.split.map(&:to_i)
A.push(10**10)
results = Array.new N, false

N.times do |i|
  if A[i+1] < A[i]
    results[i] = !results[i]
    results[i+1] = !results[i+1]
  end
end

puts results.map{|x| x ? 1 : 0}.join(' ')
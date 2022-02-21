N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
questions = []
Q.times do |i|
  x = gets.to_i
  questions.push([i, x])
end
questions.sort_by!{|x| x[1] }
results = Array.new Q
questions.each do |i, v|
  while A[0] && (A[0] < v)
    A.shift
  end
  results[i] = A.size
end

Q.times do |i|
  puts results[i]
end
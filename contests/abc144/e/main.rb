N,K= gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
F = gets.split.map(&:to_i).sort.reverse
max_time = A.map.with_index{|a,i| a * F[i]}.max

puts (0...(max_time+1)).bsearch{|x|
  k = K
  N.times do |i|
    next if A[i] * F[i] <= x
    k -= A[i] - (x / F[i])
    break if k < 0
  end
  k >= 0
}
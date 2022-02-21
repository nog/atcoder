N, D = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

list = (1..N).to_a - A
hash = {}
list.each do |x|
  hash[x] = true
end
# warn list.inspect
dp = Array.new N+1
dp[0] = {
  0 => 1
}
N.times do |i|
  a = A[i]
  d = {}
  res = {}
  bd = dp[i]
  sum = bd.values.sum
  if a == -1
    ([i+1-D, 1].max..[i+1+D, N].min).to_a.each do |kouho|
      d[kouho] = 
    end
  else
  end
  d[0] = bd[[i-D, 0].max]
end
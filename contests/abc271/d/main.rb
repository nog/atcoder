N, S = gets.split.map(&:to_i)
dlist = []
sum = 0
N.times do |i|
  a, b = gets.split.map(&:to_i)
  sum += a
  dlist.push(b-a)
end

dp = Array.new(N+1)
dp[0] = {
  sum => []
}
1.upto(N) do |i|
  bd = dp[i-1]
  cd = {}
  d = dlist[i-1]
  bd.each do |bsum, list|
    cd[bsum] ||= list + [false]
    cd[bsum+d] ||= list + [true]
  end
  dp[i] = cd
end
# warn dp.inspect
if dp[N][S]
  puts 'Yes'
  puts dp[N][S].map{|x| x ? "T" : "H"}.join('')
else
  puts 'No'
end
  
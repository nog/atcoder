N = gets.to_i
T = gets.split.map(&:to_i)

list = T.sort.reverse

dp = Array.new N+1
dp[0] = { 0 => true}
sum = 0
list.each_with_index do |t, i|
    sum += t
    d = {}
    dp[i].each do |k, _|
        d[k] ||= true
        d[k+t] ||= true
    end
    dp[i+1] = d
    warn d.keys.size
end

div = (sum.to_f / 2).ceil
warn "div:#{div}"
dp[N].sort.each do |x, _|
    if x >= div
        puts x
        exit
    end
end
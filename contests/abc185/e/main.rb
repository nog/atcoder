N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
bmap = Hash.new
M.times do |i|
    b = B[i]
    bmap[b] ||= []
    bmap[b].push(i)
end

warn bmap.inspect

dp = Array.new N+1
dp[0]=[0]

N.times do |i|
    a = A[i]
    blist = bmap[a].dup
    d = dp[i].dup
    unless blist
        dp[i+1] = d
        next
    end
    newd = [0]
    x = 0
    d.size.times do |k|
        while blist[0] do
            if blist[0] > d[k]
                newd[k+1] = blist[0]
                break
            else
                blist.shift
            end
        end
    end
    dp[i+1] = newd
end

warn dp.inspect

result = 9999999999999999999999999
dp[-1].each.with_index do |i|
    x = N + M - (2 * i)
    y = ((N > M) ? M : N ) - i
    if x + y < result
        result = x + y
    end
end

puts result
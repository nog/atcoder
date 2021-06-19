N, K = gets.split.map(&:to_i)

A = Array.new N
all = []
N.times do |i|
    A[i] = gets.split.map(&:to_i)
    all.push(*A[i])
end

DIV = (K**2) / 2
# warn "DIV:#{DIV}"

summap = Array.new(N+1){ Array.new(N+1, 0) }

result = all.sort.uniq.bsearch do |x|
    i = 1
    while(i <= N) do
        su = summap[i]
        su_min = summap[i-1]
        j = 1
        while(j<= N) do
            a = (A[i-1][j-1] > x) ? 1 : 0
            su[j] = su_min[j] + su[j-1] - su_min[j-1] + a
            j += 1
        end
        i += 1
    end
    ans = false
    if summap[N][N] > N*N - DIV
        ans = false
    elsif summap[N][N] <= DIV
        ans = true
    else
        i = 1
        while(i<=N-K+1) do
            su = summap[i+K-1]
            su_min = summap[i-1]
            j = 1
            while(j<=N-K+1) do
                # warn "i:#{i} j;#{j}"
                d = su[j+K-1] - su_min[j+K-1] - su[j-1] + su_min[j-1]
                # warn "i:#{i} j:#{j} d:#{d}"
                if d <= DIV
                    ans = true
                    break
                end
                j += 1
            end
            break if ans
            i+=1
        end
    end
    ans
end

# warn result
puts result
exit
N, M = gets.split.map(&:to_i)

A = Array.new M 
B = Array.new M 
M.times do |i|
    A[i], B[i] = gets.split.map(&:to_i)
end

K = gets.to_i
C = Array.new K 
D = Array.new K 
K.times do |i|
    C[i], D[i] = gets.split.map(&:to_i)
end

cnt = (2**K) - 1
result = 0

0.upto((2**K) - 1) do |x|
    res = 0
    stat = Array.new N+1
    K.times do |k|
        num = (x[k] == 1) ? C[k] : D[k]
        # warn "x:#{x} k:#{k} x[k]:#{x[k]} num:#{num}"
        stat[num] ||= true
    end
    # warn stat.inspect

    M.times do |i|
        if stat[A[i]] && stat[B[i]]
            res += 1
        end
    end
    if res > result
        result = res
    end
end

puts result
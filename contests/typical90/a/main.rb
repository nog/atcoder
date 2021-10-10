N, L = gets.split.map(&:to_i)
K = gets.to_i
A = gets.split.map(&:to_i)

result = (1..L).bsearch do |x|
    cnt = 0
    start = 0
    N.times do |i|
        ai = A[i]
        if ai - start >= x
            cnt += 1
            start = ai
        end
    end
    res = (cnt > K || (cnt == K && (L - start) >= x))
    
    !res
end

result = result - 1
puts result
N, P, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).map{|a| a % P}

res = 0
N.times do |i|
    ai = A[i]
    (i+1).upto(N-1) do |j|
        rj = ai * A[j] % P
        (j+1).upto(N-1) do |k|
            ak = A[k]
            rk = rj * A[k] % P
            (k+1).upto(N-1) do |l|
                rl = rk * A[l] % P
                m = l + 1
                while(m < N) do
                    res += 1 if rl * A[m] % P == Q
                    m += 1
                end
            end
        end
    end
end

puts res
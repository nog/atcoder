N, P, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

res = 0

if Q == 0
    ap = A.map{|a| a % P }
    zero = ap.count(0)

    res = (N*(N-1)*(N-2)*(N-3)*(N-4))/(5*4*3*2) - ((N-zero)*(N-zero-1)*(N-zero-2)*(N-zero-3)*(N-zero-4)/(5*4*3*2))

else
    A.map{|a| a % P }.find_all{|a| a != 0 }.combination(5){|ar|
        res += 1 if Q == ar.inject(1){|a, r| (r * a % P)}
    }
end

puts res
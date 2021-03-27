N = gets.to_i
result = N

require 'prime'
hash = {}
2.upto((N**0.5).to_i).each do |i|
    primes = i.prime_division
    x = Math.log(N, i).to_i

    2.upto(x) do |j|
        y = i**j
        if hash[y]
            break
        else
            hash[y] = true
            result -= 1
        end
    end
end

puts result
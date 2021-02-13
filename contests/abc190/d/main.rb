N = gets.to_i

#  N = n/2(2a + (n-1)d)
#  2N = n(2a + (n-1)d)
#  2N = 2na + n^2 - n
#  2N = n^2 + (2a -1)n
#  2N = n ( n + 2a - 1)

# (a+l)(l-a+1) = 2N
# -a^2 + al + a + l^2 -al + l
# l^2 -a^2 + a + l
# l^2 - (l-n+1)^2 +l+l-n+1
# l^2 -(l-n+1)^2 +2l -n + 1
# l^2 -(l^2-ln+1-ln+n^2-n+l-n+1) + 2l -n +1
# l^2 -l^2 +2ln -2 -n^2 + 2n + 2l -n +1
# n^2 + n + 2ln -1 + 2l

require 'prime'
primes = Prime.prime_division((2 * N))

bain = 2 * N
max = Math.sqrt(bain).to_i
result = 0
1.upto(max) do |i|
    next unless bain % i == 0
    x = bain / i
    next if (i+x).even?
    if i == x
        result += 1
    else
        result +=2
    end
end

puts result
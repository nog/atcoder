N = gets.to_i 
X = gets.split.map(&:to_i).sort
primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
psize = primes.size
result = primes.inject(:*)
[true, false].repeated_permutation(psize).each do |list|
    kouho = 1
    psize.times do |i|
        kouho *= primes[i] if list[i]
    end
    next if kouho > result
    if X.all? {|x| x.gcd(kouho) > 1 }
        result = kouho
    end
end

puts result
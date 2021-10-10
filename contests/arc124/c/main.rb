N = gets.to_i
A = Array.new N
B = Array.new N
N.times do |i|
  A[i], B[i] = gets.split.map(&:to_i)
end

require 'prime'
a_primes = A[0].prime_division.to_h
b_primes = B[0].prime_division.to_h

max_primes = a_primes.dup
b_primes.each do |pri, c|
  if !max_primes[pri]
    max_primes[pri] = c
  elsif max_primes[pri] < c
    max_primes[pri] = c
  end
end

# warn max_primes.inspect
N.times do |i|
  a, b = A[i], B[i]
  mkeys = max_primes.keys
  mkeys.each do |k|
    c = max_primes[k]
    while(c > 0) do
      d = k ** c
      if (a % d == 0) || (b % d == 0)
        break
      else
        c -= 1
      end
    end
    if c == 0
      max_primes.delete(k)
    else
      max_primes[k] = c
    end
  end
end
# warn max_primes.inspect
list = []
max_primes.each do |x, c|
  list += [x] * c
end

# warn list.inspect

max = 1
list.each do |x|
  max *= x
end

a = max.gcd(A[0])
b = max.gcd(B[0])

1.upto(N-1) do |i|
  a1, b1 = a.gcd(A[i]), b.gcd(B[i])
  a2, b2 = a.gcd(B[i]), b.gcd(A[i])
  if a1.lcm(b1) > a2.lcm(b2)
    a, b = a1, b1
  else
    a, b = a2, b2
  end
end

puts a.lcm(b)
N = gets.to_i

max = N.pow(0.333333334)
# warn "N:#{N} max:#{max.to_i}"

require 'prime'
primes = Prime.each(max).to_a
# warn "primes.size: #{primes.size}"

result = 0

while(pri = primes.pop) do
  tri = pri.pow(3)
  primes.each do |pri2|
    if tri * pri2 <= N
      # warn "pri:#{pri} pri2:#{pri2}"
      result += 1
    else
      break
    end
  end
end

puts result
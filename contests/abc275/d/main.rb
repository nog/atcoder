N = gets.to_i

@memo = {}
@memo[0] = 1

def f k
  @memo[k] ||= f(k/2) + f(k/3)
end

puts f N
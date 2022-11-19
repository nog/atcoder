N = gets.to_i

def f n
  if n == 0
    return 1
  else
    n * f(n-1)
  end
end

puts f(N)
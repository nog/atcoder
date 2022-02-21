t = gets.to_i

def f x
  x**2+2*x+3
end

puts f(f(f(t)+ t)+ f(f(t)))
N = gets.to_i

a = 0
result = N ** 2
while(true) do
  b = a
  res = nil
  while(true) do
    x = (a**3)+(b**3) + ((a**2) * b) + (a * (b**2))
    if x > N
      res = x
      break
    else
      b += 1
    end
  end
  if res < result
    # warn "a:#{a} b:#{b} res:#{res}"
    result = res
  else
    break
  end
  a += 1
end

puts result
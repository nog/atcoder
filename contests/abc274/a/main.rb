A, B = gets.split.map(&:to_i)

x = B * 10000 / A

# warn x
if (x % 10) >= 5
  x += 10
end

x /= 10
res = x.to_s.split('')

while(res.size < 3)
  res.push(0)
end
# warn res.inspect
if res.size == 3
  res.unshift(".")
  res.unshift(0)
else
  res.insert(1, ".")
end
puts res.join('')
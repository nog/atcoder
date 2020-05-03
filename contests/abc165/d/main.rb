a, b, n = gets.split.map(&:to_i)

pat = []
pat.push( ((a * n) / b) -  (a * (n / b)) )
if b < n
  pat.push( ((a * b) / b) - a )
end
if b <= n
  pat.push( ((a * (b-1)) / b) )
end
puts pat.max 
N = gets.to_i
ABC = Array.new N
res = 0
N.times do |i|
  a, b, c = gets.split.map(&:to_i)
  ABC[i] = [a,b,c]
  if a == b
    r = c.to_f / x
    res = [r, res].max
  else
    x = [a,b].max
    r = c.to_f / r
    res = [r, res].max
  end
end

ABC.combination(2) do |arr|
  a, b = arr
  next if a[0] >= a[1] && b[0] >= b[1]
  next if a[1] >= a[0] && b[1] >= b[0]
  b, a = a, b if a[1] > a[0]
end
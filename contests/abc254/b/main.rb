N = gets.to_i

a = Array.new N
N.times do |i|
  res = []
  (i+1).times do |j|
    if j == 0 || j == i
      res.push(1)
    else
      res.push(a[i-1][j-1] + a[i-1][j])
    end
  end
  a[i] = res
  puts res.join(' ')
end
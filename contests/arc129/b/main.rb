N = gets.to_i
LR = Array.new N
N.times do |i|
  LR[i] = gets.split.map(&:to_i)
end

minr = 10**10
maxl = 0
kouho = 0
N.times do |i|
  l, r = LR[i]
  res = [0]
  [l, r, kouho].each do |x|
    if x < maxl
      res.push(maxl - x)
    end
    ifx > minr 
      res.push(x - minr )
    end
  end
  rr = res.max
  puts rr
  kouho = rr
  maxl = l if l > maxl
  minr = r if r < minr
end
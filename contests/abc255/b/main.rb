N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

result = 0
ahash ={}
A.each do |a|
  ahash[a-1] = true
end

lights = []
nolights = []

N.times do |i|
  r = gets.split.map(&:to_i)
  if ahash[i]
    lights.push(r)
  else
    nolights.push(r)
  end
end

nolights.each do |x,y|
  res = []
  lights.each do |lx, ly|
    r = (lx - x) ** 2 + (ly - y) ** 2
    warn r
    res.push(r) 
  end
  res = res.min
  result = res if res && res > result
end

puts result ** 0.5
N, D = gets.split.map(&:to_i)
D2 = D**2

friends = Array.new(N){ Array.new }
XY = []
N.times do |i|
  x, y = gets.split.map(&:to_i)
  i.times do |j|
    x2, y2 = XY[j]
    if ((x - x2)**2 + (y-y2)**2) <= D2
      friends[i].push(j)
      friends[j].push(i)
    end
  end
  XY.push([x,y])
end

results = Array.new(N)
queue = [0]
results[0] = true
while(q = queue.shift) do
  friends[q].each do |t|
    next if results[t]
    results[t] = true
    queue.push(t)
  end
end

results.each do |r|
  puts r ? 'Yes' : 'No'
end
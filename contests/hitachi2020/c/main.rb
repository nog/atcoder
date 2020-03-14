N = gets.to_i
@edges = Array.new(N+1){ Array.new }
@edges[0].push(1)
(N-1).times do 
  a, b = gets.split.map(&:to_i)
  @edges[a].push(b)
  @edges[b].push(a)
end

@pairs = []

@qq = [
  [1, nil, nil, nil]
]

def trav node, parent, gparent, ggparent
  if ggparent
    @pairs.push([node, ggparent])
  end
  if gparent
    @edges[gparent].each do |nn|
      next if nn == parent
      @pairs.push([node, nn])
    end
  end
  @edges[node].each do |child|
    next if child == parent
    @qq.push([child, node, parent, gparent])
  end
end

while q = @qq.shift do
  trav(*q)
end
result = Array.new N
counts = {}
@pairs.each do |pair|
  counts[pair[0]] ||= 0
  counts[pair[1]] ||= 0
  counts[pair[0]] += 1
  counts[pair[1]] += 1
end
used = 0
counts.each do |k,v|
  if v > 1
    used += 3
    if used > N
      puts -1
      exit
    end
    result[k-1] = used
  end
end
nused = 0
@pairs.each do |pair|
  next if result[pair[0]-1] || result[pair[1]-1]
  result[pair[0]-1] = nused + 1
  result[pair[1]-1] = nused + 2
  nused += 3
end
result = result.map do |x|
  if x
    x
  else
    if nused == 0 || nused % 3 != 2
      nused += 1
    else
      nused += 2
    end
    nused
  end
end

puts result.join(' ')
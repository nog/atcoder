N = gets.to_i

if N.odd?
  puts ''
  exit
end

exists = {}
queue = [[1]]
result = []

while(q = queue.shift) do
  size = q.size
  if size == N
    result.push(q)
    next
  end

  cur = q[-1]
  ne = cur - 1
  if ne >= 0
    nq = q.dup
    nq.push(ne)
    queue.push(nq)
  end

  ne = cur + 1
  if ne < N - size
    nq = q.dup
    nq.push(ne)
    queue.push(nq)
  end
end

result.map {|x|
  b = 0
  x.map{|n|
     res = n - b == 1 ? '(' : ')'
     b = n
     res
  }.join('')
}.sort.each do |x|
  puts x
end
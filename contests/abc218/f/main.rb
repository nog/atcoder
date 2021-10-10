N, M = gets.split.map(&:to_i)

routes = {}
M.times do |i|
  s, t = gets.split.map(&:to_i)
  routes[s] ||= {}
  routes[s][t] = i
end

queue = [[1, []]]
min = nil

gone = {}
gone[1] = true

while(current, history = queue.shift) do
  break unless routes[current]
  routes[current].each do |to, line|
    if to == N
      history.push(line)
      min = history
      break
    elsif gone[to]
      next
    end
    gone[to] = true
    queue.push([to, history.dup.push(line)])
  end
  break if min
end


minhash = {}
(min || []).each do |m|
  minhash[m] = true
end
minsize = min ? min.size : 0

M.times do |i|
  unless min
    puts -1
    next
  end
  unless minhash[i]
    puts minsize
    next
  end

  gone = {}
  gone[1] = true
  queue = [[1, 0]]
  res = nil
  while(current, step = queue.shift) do
    routes[current].each do |to, line|
      next if line == i
      next if gone[to]
      if to == N
        res = step+1
        break
      end
      gone[to] = true
      queue.push([to, step+1])
    end
    break if res
  end
  puts res || -1
end
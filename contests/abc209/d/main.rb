N, Q = gets.split.map(&:to_i)
INF = N*10

routes = Array.new(N+1){ [] }
(N-1).times do
  a, b = gets.split.map(&:to_i)
  routes[a].push(b)
  routes[b].push(a)
end

flags = Array.new N+1
flags[1] = true

queue = [1]

while(parent = queue.shift) do
  fl = !flags[parent]
  list = routes[parent]
  list.each do |to|
    next if flags[to] != nil
    flags[to] = fl
    queue.push(to)
  end
end

Q.times do
  c, d = gets.split.map(&:to_i)
  if flags[c] == flags[d]
    puts 'Town'
  else
    puts 'Road'
  end
end
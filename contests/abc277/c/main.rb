N = gets.to_i

routes = {}
N.times do
  a, b = gets.split.map(&:to_i)
  routes[a] ||= []
  routes[b] ||= []
  routes[a].push(b)
  routes[b].push(a)
end

result = 1

queue = [1]
dones = {}
dones[1] = true

while(q = queue.shift) do
  (routes[q] || []).each do |ne|
    next if dones[ne]
    queue.push(ne)
    dones[ne] = true
    result = ne if result < ne
  end
end

puts result
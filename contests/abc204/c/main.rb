N, M = gets.split.map(&:to_i)

AB = Array.new M

routes = {}
M.times do |i|
    a, b = gets.split.map(&:to_i)
    routes[a] ||= []
    routes[a].push(b)
end

queue = []

dones = {}
# res = N

res = 0

1.upto(N) do |i|
    visited = Array.new(N+1)
    visited[i] = true
    queue = routes[i] ? [i] : []
    res += 1
    while !queue.empty? do
        c = queue.shift
        routes[c].each do |to|
            if visited[to]
                next
            end
            visited[to] = true
            res += 1
            queue.push(to) if routes[to]
        end
    end
end

puts res
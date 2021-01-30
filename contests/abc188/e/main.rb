N, M = gets.split.map(&:to_i)
A = [false] + gets.split.map(&:to_i)

childs = Array.new(N+1){ [] }
parents = Array.new(N+1){ [] }
xy = Array.new M
M.times do |i|
    x, y = gets.split.map(&:to_i)
    xy[i] = [x, y]
    childs[x].push(y)
    parents[y].push(x)
end

result = A[xy[0][1]] - A[xy[0][0]]

queue = []
N.times do |i|
    if parents[i].size == 0
        a = A[i]
        childs[i].each do |ch|
            queue.push([ch, a])
        end
    end
end

cache = Array.new(N+1, false)
while(node, min = queue.shift) do
    a = A[node]
    if cache[node] && cache[node] <= min
        next
    end
    if a - min > result
        result = a - min
    end
    if a < min
        min = a
    end
    cache[node] = min
    childs[node].each do |ch|
        if cache[ch] && cache[ch] <= min
            next
        end
        queue.push([ch, min])
    end
end

puts result
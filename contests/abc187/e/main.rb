N = gets.to_i

A, B = Array.new(N-1), Array.new(N-1)

nodes = Array.new(N+1){ [] }
lines  = Array.new(N+1){ [] }
parents  = Array.new(N+1)
linemuki = Array.new N
(N-1).times do |i|
    a, b = gets.split.map(&:to_i)
    A[i], B[i] = a, b
    nodes[a].push b
    nodes[b].push a
    lines[a].push i
    lines[b].push i
end

parents[1] = 0
1.upto(N) do |i|
    pare = parents[i]
    lines[i].each do |x|
        a, b = A[x], B[x]
        next if a == pare || b == pare
        if b == i
            linemuki[x] = false
            parents[a] = i
        else
            linemuki[x] = true
            parents[b] = i
        end
    end
end

c = Array.new(N + 1){ 0 }
d = Array.new(N + 1){ 0 }

Q = gets.to_i
Q.times do |i|
    t, e, x = gets.split.map(&:to_i)
    e = e - 1
    a, b = A[e], B[e]
    if t == 1
        if linemuki[e]
            c[0] += x
            c[a] -= x
        else
            d[a] += x
        end
    else
        if linemuki[e]
            d[b] += x
        else
            c[0] += x
            c[b] -= x
        end
    end
end

result = Array.new N + 1
result[0] = 0
queue = [1]

donehash = {}

while q = queue.shift do
    next if donehash[q]
    pare = parents[q]
    result[q] = result[pare] + c[pare] + d[q]
    queue.push(*nodes[q])
    donehash[q] = true
end

warn linemuki.inspect
warn parents.inspect
warn c.inspect
warn d.inspect
1.upto(N) do |i|
    puts result[i]
end
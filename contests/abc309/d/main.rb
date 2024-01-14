N1, N2, M = gets.split.map(&:to_i)

routes = {}
M.times do |i|
    a, b = gets.split.map(&:to_i)
    routes[a] ||= []
    routes[b] ||= []
    routes[a].push(b)
    routes[b].push(a)
end


dlist = Array.new(N1+N2+1)
dlist[1] = 0

queue = [1]

ndmax1 = 0

while(q = queue.shift) do
    d = dlist[q]
    nd = d + 1
    ndmax1 = d if d > ndmax1
    (routes[q] || []).each do |ne|
        next if dlist[ne]
        dlist[ne] = nd
        queue.push(ne)
    end
end
# warn dlist.inspect

queue = [N1+N2]
dlist[N1+N2] = 0
ndmax2 = 0
while(q = queue.shift) do
    d = dlist[q]
    nd = d + 1
    ndmax2 = d if d > ndmax2
    (routes[q] || []).each do |ne|
        next if dlist[ne]
        dlist[ne] = nd
        queue.push(ne)
    end
end

# warn dlist.inspect

puts ndmax1 + ndmax2 + 1
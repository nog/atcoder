N = gets.to_i
A = gets.split.map(&:to_i)

points = {}
N.times do |i|
    a = A[i]
    points[a] ||= []
    points[a].push(i)
end

result = 0
list = points.keys.sort.reverse
@visited = {}

@lcache = {}
def searchl x
    l = x
    while(@visited[l-1])
        l = @lcache[l-1] || l-1
    end
    @lcache[x] = l
end

@rcache = {}
def searchr x
    r = x
    while(@visited[r+1])
        r = @rcache[r+1] || r+1
    end
    @rcache[x] = r
end

list.each do |a|
    indexes = points[a]
    indexes.each do |i|
        @visited[i] = true
        l = searchl(i)
        r = searchr(i)
        score = (r - l + 1) * a
        result = score if score > result
    end
end

puts result
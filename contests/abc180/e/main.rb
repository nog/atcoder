N = gets.to_i
X = Array.new N 
Y = Array.new N
Z = Array.new N

start = Time.now
N.times do |i|
    X[i], Y[i], Z[i] = gets.split.map(&:to_i)
end

def max a, b
    (a > b) ? a : b
end

@dis = Array.new(N) { Array.new N }
N.times do |i|
    a,b,c = X[i], Y[i], Z[i]
    N.times do |j|
        next if i == j
        tp, tq, tr = X[j], Y[j], Z[j]
        @dis[i][j] = (tp - a).abs + (tq - b).abs + max(0, (tr - c))
    end
end

def cos ro
    result = 0
    1.upto(ro.size - 1) do |i|
        result += @dis[ro[i-1]][ro[i]]
    end
    result
end


result = 9999999999999999999999
route = [0,0]
list = [*1..N-1]
cost = nil
1.upto(N-1).each do |i|
    cost = 99999999999999999999
    new_route = nil
    1.upto(route.size - 1) do |ins|
        nr = route.dup.insert(ins, i)
        nc = cos(nr)
        if nc < cost
            new_route = nr
            cost = nc
        end
    end
    route = new_route
end

result = cost

while(Time.now - start < 1.9) do
    t = rand(N-1) + 1
    new_route = route.dup
    target = new_route.delete(t)
    1.upto(new_route.size - 1) do |ins|
        nr = new_route.dup.insert(ins, target)
        nc = cos(nr)
        if nc < cost
            route = nr
            result = nc
        end
    end
end

puts result
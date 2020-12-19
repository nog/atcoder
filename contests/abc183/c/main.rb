N, K = gets.split.map(&:to_i)
T = Array.new N

N.times do |i|
    T[i] = gets.split.map(&:to_i)
end

queue = [[0, 0, (1..(N-1)).to_a]]

result = 0
while(q = queue.shift) do
    current = q[0]
    time = q[1]
    nexts = q[2]
    if nexts.size > 0
        nexts.each do |ne|
            dt = T[current][ne]
            if time + dt < K
                queue.push([ne, time + dt, (nexts - [ne])])
            end
        end
    else
        if time + T[current][0] == K
            result += 1
        end
    end
end

puts result
N , M = gets.split.map(&:to_i)
parents = gets.split.map(&:to_i)
childs = Array.new(N+1){ Array.new }
parents.each.with_index do |pa, i|
    childs[pa].push(i+2)
end

# warn childs.inspect

res = 0
list = Array.new(N+1)
M.times do |i|
    x, y = gets.split.map(&:to_i)
    if !list[x] || list[x] < y
        list[x] = y
    end
end

queue = [1]
while(q = queue.shift) do
    x = list[q]
    if x
        res += 1
    end
    childs[q].each do |ch|
        queue.push(ch)
        if x && x > 0
            if !list[ch] || list[ch] < x - 1
                list[ch] = x - 1
            end
        end
    end
end

puts res
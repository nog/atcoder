N, M = gets.split.map(&:to_i)
blacks = {}

M.times do |i|
    x, y = gets.split.map(&:to_i)
    blacks[x] ||= {}
    blacks[x][y] = true
end

current = {
    N => true
}

blacks.keys.sort.each do |x|
    adds = []
    dels = []
    blacks[x].keys.each do |y|
        if current[y]
            next if current[y-1] || current[y+1]
            dels.push(y)
        elsif current[y-1] || current[y+1]
            adds.push(y)
        end
    end

    dels.each do |d|
        current.delete(d)
    end
    adds.each do |a|
        current[a] = true
    end
    break if current.size == 0
end

puts current.size
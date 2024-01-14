N, M = gets.split.map(&:to_i)

weeks = Array.new(N){ Array.new }
strongs = Array.new(N){ Array.new }

M.times do
    a, b = gets.split.map(&:to_i)
    weeks[a-1].push(b-1)
    strongs[b-1].push(a-1)
end


if strongs.count([]) != 1
    puts -1
    exit
end


puts strongs.find_index([]) + 1
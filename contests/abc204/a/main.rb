x, y = gets.split.map(&:to_i)

if x == y
    puts x
    exit
end

puts ([0,1,2] - [x,y])[0]
N = gets.to_i
D = Array.new N

count = 0
N.times do |i|
    d1, d2 = gets.split.map(&:to_i)
    if d1 == d2
        count += 1
    else
        count = 0
    end
    if count == 3
        puts 'Yes'
        exit
    end
end

puts "No"
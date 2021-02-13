N, S, D = gets.split.map(&:to_i)
N.times do |i|
    x, y = gets.split.map(&:to_i)
    if x < S && y > D
        puts 'Yes'
        exit
    end
end

puts 'No'
N, K = gets.split.map(&:to_i)
ab = []
bsum = 0
N.times do 
    a, b = gets.chomp.split.map(&:to_i)
    bsum += b
    ab.push([a,b])
end

if bsum <= K
    puts 1
    exit
end

ab.sort!
ab.each do |a, b|
    bsum -= b
    if bsum <= K
        puts a + 1
        exit
    end
end
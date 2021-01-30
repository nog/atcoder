N, X = gets.split.map(&:to_i)

result = 0
alc = 0
N.times do |i|
    result += 1
    v, pe = gets.split.map(&:to_i)
    alc += v * pe
    if alc > X * 100
        puts result
        exit
    end
end

puts -1
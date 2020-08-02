a, b, c = gets.split.map(&:to_i)
K = gets.to_i

if  c > b && b > a
    puts 'Yes'
    exit
end

K.times do
    if b <= a
        b *= 2
    elsif c <= b
        c *= 2
    end
    if  c > b && b > a
        puts 'Yes'
        exit
    end
end

puts 'No'
S = gets.split.map(&:to_i)

b = -1
S.each do |s|
    if b > s
        puts 'No'
        exit
    end
    if s < 100 || s > 675
        puts 'No'
        exit
    end
    if s % 25 != 0
        puts 'No'
        exit
    end
    b = s
end

puts 'Yes'
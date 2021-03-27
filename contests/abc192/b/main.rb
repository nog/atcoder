S = gets.chomp

big = false
result = true

S.chars.each do |s|
    if big
        if s != s.upcase
            result = false
            break
        end
    else
        if s != s.downcase
            result = false
            break
        end
    end
    big = !big
end

puts result ? 'Yes' : 'No'
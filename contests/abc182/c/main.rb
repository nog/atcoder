N = gets.to_i

hash = {
    0 => 0,
    1 => 0,
    2 => 0
}
sum = 0
list = N.to_s.split('').each do |x|
    hash[x.to_i % 3] += 1
    sum += x.to_i
end
sum = sum % 3
if hash[0] == 0 && (hash[1] == 0 || hash[2] == 0)
    puts -1
else
    if sum == 0
        puts 0
    elsif sum == 1
        if hash[1] > 0
            puts 1
        else
            puts (hash[2] - hash[1]).abs % 3
        end
    elsif sum == 2
        if hash[2] > 0
            puts 1
        else
            puts (hash[2] - hash[1]).abs % 3
        end
    else
        raise
    end
end
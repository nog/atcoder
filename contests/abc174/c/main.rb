K = gets.to_i

if K == 1
    puts 1
    exit
end

if K.even?
    puts -1
    exit
end

if K % 5 == 0
    puts -1
    exit
end

x = 7
result = 1
while x % K != 0 do
    while x < K do
        x = x * 10 + 7
        result += 1
    end
    x = x % K

end
puts result

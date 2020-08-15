N = gets.to_i
C = gets.chomp
c = C.split('')

result = 0
while c.length > 1 do
    while(c[0] == 'R') do
        c.shift
    end
    while(c[-1] == 'W') do
        c.pop
    end
    if c.length < 2
        puts result
        exit
    end
    c.shift
    c.pop
    result += 1
end
puts result
a, b, x, y = gets.split.map(&:to_i)

if a == b
    puts x
    exit
end

result = 0

if a > b
    while(a > b + 1) do
        if 2 * x > y
            result += y
            a -= 1
        else
            result += 2 * x
            a -= 1
        end
    end

    puts result + x
    exit
else
    while(a < b) do
        if 2 * x >  y
            result += y
            a += 1
        else
            result += 2 * x
            a += 1
        end
    end

    puts result + x
end
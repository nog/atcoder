r1, c1 = gets.split.map(&:to_i)
r2, c2 = gets.split.map(&:to_i)

if r1 == r2 && c1 == c2 
    puts 0
    exit
end

if (r2 - r1).abs + (c2 - c1).abs <= 3
    puts 1
    exit
end

if (r1 + c1 == r2 + c2) || (r1 - c1 == r2 - c2)
    puts 1
    exit
end

if (r2 - r1).abs + (c2 - c1).abs <= 6
    puts 2
    exit
end

if ((r2 + c2) - (r1 + c1)).abs <= 3 || ((r2 -c2) - (r1 - c1)).abs <= 3
    puts 2
    exit
end

if (r1 + c1).odd? == (r2 + c2).odd?
    puts 2
else
    puts 3
end
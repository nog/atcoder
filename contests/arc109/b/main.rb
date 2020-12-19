n = gets.to_i

if n == 1
    puts 1
    exit
end

if n == 2
    puts 1
    exit
end

if n == 3
    puts 2
    exit 
end

a = (1..n).bsearch do |x|
    x * ( x + 1) / 2 > n + 1
end

puts n - a + 2
T = gets.to_i
CASE = Array.new T 
T.times do |i|
    l, r = gets.split.map(&:to_i)
    if l == 0 && r == 0
        puts 1
        next
    elsif 2 * l > r
        puts 0
        next
    end
    first = 1
    last = r - 2 * l + 1
    n = r - 2 * l + 1
    puts (first + last) * n / 2
end
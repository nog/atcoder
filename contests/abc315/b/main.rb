M = gets.to_i
D = gets.split.map(&:to_i)

sum = D.sum

s = 0
D.each.with_index do |d, m|
    if s + d > (sum / 2)
        puts "#{m+1} #{(sum / 2)  - s + 1}"
        exit
    else
        s += d
    end
end
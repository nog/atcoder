N = gets.to_i
a = gets.split.map(&:to_i)

result = 0
a.each.with_index do |x, i|
    if i.even? && x.odd?
        result += 1
    end
end

puts result
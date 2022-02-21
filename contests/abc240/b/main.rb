N = gets.to_i
A = gets.split.map(&:to_i)

done = {}
result = 0

A.each do |a|
  unless done[a]
    done[a] = true
    result += 1
  end
end

puts result
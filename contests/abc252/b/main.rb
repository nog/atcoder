N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

max = A.max
indexes = {}
A.each.with_index do |a, i|
  indexes[i+1] = true if a == max
end

B.each do |b|
  if indexes[b]
    puts 'Yes'
    exit
  end
end
puts 'No'
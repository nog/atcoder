N, X = gets.split.map(&:to_i)

list = []
26.times do |i|
  list += [("A".ord + i).chr] * N
end

puts list[X-1]
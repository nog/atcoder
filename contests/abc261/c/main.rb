N = gets.to_i
S = Array.new N

counts = Hash.new
N.times do |i|
  s = gets.chomp
  if c = counts[s]
    puts "#{s}(#{c})"
    counts[s] += 1
  else
    puts s
    counts[s] = 1
  end
end
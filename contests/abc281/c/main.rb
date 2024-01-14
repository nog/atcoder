N, T = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

t = T % A.sum

A.each.with_index do |a, i|
  t -= a
  if t < 0
    puts "#{i+1} #{a+t}"
    exit
  end
end
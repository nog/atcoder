T = gets.to_i
T.times do
  a, s = gets.split.map(&:to_i)
  if 2*a > s
    puts 'No'
    next
  end
  d = s - (2 * a)
  puts (d & a) == 0 ? 'Yes' : 'No'
end
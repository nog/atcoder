A1, A2, A3 = gets.split.map(&:to_i)

if A2 - A1 == A3 - A2
  puts 0
  exit
end

if 2 * A2 - A1 - A3 > 0
  puts (2 * A2 - A1 - A3)
  exit
else
  x = 2 * A2 - A1 - A3
  if x.even?
    puts -x/2
    exit
  else
    puts -x/2 + 2
    exit
  end
end
N = gets.to_i
$stdout.sync = true

l = 1
r = N

20.times do
  c = (l + r) / 2
  puts "? #{c}"
  x = gets.to_i
  if x == 0
    l = c
  else
    r = c
  end
  if l + 1 == r
    puts "! #{l}"
    exit
  end
end
raise
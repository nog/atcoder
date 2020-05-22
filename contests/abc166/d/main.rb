x = gets.to_i
list5 = []
hash5 = {}
a = 1
while(true) do
  a5 = a**5
  hash5[a5] = a
  b5 = - (x - a5)
  if b5 == 0
    puts "#{a} 0"
    exit
  end
  if b = hash5[b5]
    puts "#{a} #{b}"
    exit
  end
  if b = hash5[-b5]
    puts "#{a} #{-b}"
    exit
  end
  a += 1
end
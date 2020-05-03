a, b, c, d = gets.split.map(&:to_i)

while true do
  c = c - b
  if c <= 0
    puts 'Yes'
    exit
  end
  a = a - d
  if a <= 0
    puts 'No'
    exit
  end
end
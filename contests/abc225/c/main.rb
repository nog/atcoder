N, M = gets.split.map(&:to_i)

b = gets.split.map(&:to_i)
s = (b[0] - 1) % 7
c = s
bd = nil
b.each do |d|
  if (d - 1) % 7 != c
    puts 'No'
    exit
  end
  if bd && bd + 1 != d
    puts 'No'
    exit
  end
  c += 1
  bd = d
end

bb = b
(N-1).times do |i|
  b = gets.split.map(&:to_i)
  if b[0] != bb[0] + 7
    puts 'No'
    exit
  end
  c = s
  bd = nil
  b.each do |d|
    if (d-1) % 7 != c
      puts 'No'
      exit
    end
    if bd && bd + 1 !=d
      puts 'No'
      exit
    end
    bd = d
    c += 1
  end
  bb = b
end

puts 'Yes'
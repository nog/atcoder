N = gets.to_i
list = []
3.upto(N) do |i|
  puts "? 1 #{i}"
  STDOUT.flush
  d = gets.to_i
  if d == 1
    list.push(i)
  end
end

list2 = []
list.each do |i|
  puts "? 2 #{i}"
  STDOUT.flush
  d2 = gets.to_i
  list2.push(d2)
end

if list.size == 0
  puts "! 1"
elsif list2.size > 1
  if list2.max == list2.min
    puts "! 1"
  else
    puts "! #{1 + list2.min}"
  end
else
  d = list2[0]
  if d != 2
    puts "! #{1 + d}"
  elsif N == 3
    puts "! 1"
  else
    t = list[0]
    if t == N
      t = 3
    else
      t = t + 1
    end
    puts "? 1 #{t}"
    STDOUT.flush
    d1 = gets.to_i
    puts "? 2 #{t}"
    STDOUT.flush
    d2 = gets.to_i
    if (d2 - d1).abs == 1
      if t == N
        t = 3
      else
        t = t + 1
      end
      puts "? 1 #{t}"
      STDOUT.flush
      puts "! 1"
      d1 = gets.to_i
      puts "? 2 #{t}"
      STDOUT.flush
      d2 = gets.to_i
      if (d2 - d1).abs == 1
        puts "! 1"
      else
        puts "! #{1 + d}"
      end
    else
      puts "! #{1 + d}"
    end
  end
end
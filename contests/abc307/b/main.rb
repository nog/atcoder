N = gets.to_i
list = []
N.times do |i|
  s = gets.chomp
  list.each do |s2|
    ss = s + s2
    if ss == ss.reverse
      puts 'Yes'
      exit
    end
    ss = s2 + s
    if ss == ss.reverse
      puts 'Yes'
      exit
    end
  end
  list.push(s)
end

puts "No"
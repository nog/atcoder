N = gets.to_i
A = gets.split.map(&:to_i)


lenlist = Array.new(8){ Array.new }

A.each do |a|
  len = a.to_s.length
  lenlist[len].push(a)
end

reslist = []

7.downto(1) do |len|
  list = lenlist[len]
  next if list.size == 0
  list.sort.reverse.each do |a|
    reslist.push(a)
    break if reslist.size == 3
  end
  break if reslist.size == 3
end


max = 0
slist = reslist.map{|a| a.to_s }
slist.permutation(3).each do |l|
  r = l.join('').to_i
  max = r if r > max
end
puts max
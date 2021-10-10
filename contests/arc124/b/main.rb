N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
map_b = Hash.new 0
B.each do |b|
  map_b[b] += 1
end 

fa = A[0]

kouho = B.map{|b| b ^ fa }
# warn kouho.inspect
list = []
kouho.each do |x|
  result = true
  dmap = map_b.dup
  A.each do |a|
    b = a ^ x
    if dmap[b] == 0
      result = false
      break
    end
    dmap[b] -= 1
  end
  if result
    list.push x
  end
end
list.uniq!
puts list.size
list.sort.each do |x|
  puts x
end
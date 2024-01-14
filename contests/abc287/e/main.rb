N = gets.to_i
hash = Hash.new 0
list = []

start = [-1, 0, {}]
N.times do
  s = gets.chomp.split('')
  list.push(s)
  point = start
  s.each do |ss|
    point = point[2][ss] ||= [point[0]+1, 0, {}]
    point[1] += 1
  end
end

#warn start.inspect
# warn list.inspect 
# warn hash.inspect
list.each do |s|
  point = start
  res = true
  s.each do |ss|
    point = point[2][ss]
    if point[1] == 1
      res = false
      puts point[0]
      break
    end
  end
  if res 
    puts s.size
  end
end
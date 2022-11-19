N, M = gets.split.map(&:to_i)
S = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)

l = 0
dcounts = Hash.new 0
X.each do |x|
  dcounts[x] = 1
end
S.each.with_index do |s, i|
  l = (s - l)
  X.each do |x|
    if i.even?
      dcounts[x-l] += 1
    else
      dcounts[l-x] += 1
    end
  end
end
# warn dcounts.inspect
max = dcounts.values.max
puts max
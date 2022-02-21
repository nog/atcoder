N, X = gets.split.map(&:to_i)

list = [0]
N.times do |i|
  a, b = gets.split.map(&:to_i)
  nhash = {}
  list.each do |l|
    nhash[l+a] = true if l+a <= X
    nhash[l+b] = true if l+b <= X
  end
  list = nhash.keys
end

if list.include?(X)
  puts 'Yes'
else
  puts 'No'
end
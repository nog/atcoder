N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

if K == 1
  puts 'Yes'
  exit
end

sorted_a = A.sort

a_pos = {}
sorted_a_pos = {}

N.times do |i|
  a = A[i]
  sa = sorted_a[i]
  a_pos[a] ||= []
  a_pos[a].push(i % K)
  sorted_a_pos[sa] ||= []
  sorted_a_pos[sa].push(i % K)
end

a_pos.keys.each do |a|
  if a_pos[a].sort != sorted_a_pos[a].sort
    puts 'No'
    exit
  end
end
puts 'Yes'
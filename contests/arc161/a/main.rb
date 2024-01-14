N = gets.to_i
A = gets.split.map(&:to_i).sort!

if A[(N/2)] != A[(N/2)+1]
  puts 'Yes'
  exit
end

min = A[0]
mincnt = A.count(min)
if mincnt > (N/2) + 1
  puts 'No'
  exit
end

max = A[-1]
maxcount = A.count(max)
if maxcount > (N/2)
  puts 'No'
  exit
end

counts = {}
A.each do |a|
  counts[a] ||= 0
  counts[a] += 1
end

if counts.values.max > (N/2)
  puts 'No'
  exit
end

puts 'Yes'

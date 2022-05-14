N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

positions_a = {}
positions_b = {}
N.times do |i|
  a = A[i]
  positions_a[a] ||= []
  positions_a[a].push(i)
  b = B[i]
  positions_b[b] ||= []
  positions_b[b].push(i)
end

def die
  puts 'No'
  exit
end

def success
  puts 'Yes'
  exit
end

positions_a.each do |key, list|
  die unless positions_b[key]
  die unless list.size == positions_b[key].size
end

a = A.dup
(N-3).times do |i|
  b = B[i]
  indexes = a.filter_map.with_index{|e,i| i if e == b }
  if indexes.map{|x| x.even? }.uniq.size == 2
    success
  end
  ai = indexes[0]
  a.delete_at(ai)
  if ai.odd?
    a[0], a[1] = a[1], a[0]
  end
end

last3 = B[-3..-1]
# warn last3
[[0,1,2],[2,0,1],[1,2,0]].each do |n1,n2,n3|
  if a[n1] == last3[0] && a[n2] == last3[1] && a[n3] == last3[2]
    success
  end
end

die
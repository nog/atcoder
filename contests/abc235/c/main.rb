N, Q= gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
lists = {}
N.times do |i|
  a = A[i]
  lists[a] ||= []
  lists[a].push(i)
end
queries = {}
Q.times do |i|
  x, k = gets.split.map(&:to_i)
  li = lists[x] || []
  if li.size >= k
    puts li[k-1] + 1
  else
    puts -1
  end
end
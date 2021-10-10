L, Q = gets.split.map(&:to_i)

splits = [0,L]
results = Array.new L
queue = []
Q.times do  |i|
  c, x = gets.split.map(&:to_i)
  if c == 1
    min = 0
    queue.sort_by{|x| x[0] }.each do |q, i|
      ind = splits[min..-1].bsearch_index{|y| y > q }
      min = ind
      results[i] = splits[ind] - splits[ind-1]
    end
    queue = []
    index = splits.bsearch_index{|y| y > x }
    splits.insert(index, x)
  else
    queue.push([x,i])
    # results.push splits[index] - splits[index-1]
  end
  # warn splits.inspect
end
min = 0
queue.sort_by{|x| x[0] }.each do |q, i|
  ind = splits[min..-1].bsearch_index{|y| y > q }
  min = ind
  results[i] = splits[ind] - splits[ind-1]
end
puts results.compact.join("\n")
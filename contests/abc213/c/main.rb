H, W, N = gets.split.map(&:to_i)

exists_row = {}
exists_col = {}
list = []
N.times do |i|
  a, b = gets.split.map(&:to_i)
  list.push([a,b])
  exists_row[a] = true
  exists_col[b] = true
end

row_map = {}
col_map = {}

exists_row.keys.sort.each.with_index do |r, i|
  row_map[r] = i
end

exists_col.keys.sort.each.with_index do |c, i|
  col_map[c] = i
end

list.each do |a, b|
  puts [row_map[a] + 1, col_map[b] + 1].join(' ')
end
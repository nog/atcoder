H, W = gets.split.map(&:to_i)
A = Array.new H
H.times do |i|
  A[i] = gets.chomp.split('')
end

Q = gets.to_i
rows = (0...H).to_a
cols = (0...W).to_a
rs = 0
cs = 0
Q.times do |q|
  a, b = gets.split.map(&:to_i)
  # x = rows[0...a].reverse + rows[a..-1].reverse
  # warn rows.inspect 
  # warn a
  # warn x.inspect

  # rows.reverse!
  # rows = rows[H-a..-1] + rows[0...H-a]
  if q.odd? 
    a = H - a
    b = W - b
  end
  rs = (rs + a) % H
  cs = (cs + b) % W
  # rows = rows[a..-1] + rows[0...a]
  # warn rows.inspect
  # warn "---"

  # cols = cols[0...b].reverse + cols[b..-1].reverse
  # cols.reverse! 
  # cols = cols[W-b..-1] + cols[0...W-b]
  
  # cols = cols[b..-1] + cols[0...b]
end

rows = rows[rs..-1] + rows[0...rs]
cols = cols[cs..-1] + cols[0...cs]

if Q.odd?
  rows.reverse! 
  cols.reverse!
end

results = []
rows.each do |h|
  res = []
  ah = A[h]
  cols.each do |c|
    res.push(ah[c])
  end
  results.push res.join('')
end

puts results.join("\n")
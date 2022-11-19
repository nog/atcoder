Q = gets.to_i

note = Hash.new
a = []
results = Array.new(Q)
queries = []
root = { parent: nil, number: nil }
cur = root
Q.times do |i|
  m, x = gets.split
  x = x.to_i
  if m == "ADD"
    child = { parent: cur, number: x }
    results[i] = x
    cur = child
  elsif m == "DELETE"
    cur = cur[:parent] if cur[:parent]
    results[i] = cur[:number] || -1
  elsif m == "SAVE"
    note[x] = cur
    results[i] = cur[:number] || -1
  elsif m == "LOAD"
    cur = note[x] || root
    results[i] = cur[:number] || -1
  else
    raise
  end
  # warn "m:#{m} x:#{x}"
  # warn a.inspect
  # warn note.inspect
end

puts results.join(' ')
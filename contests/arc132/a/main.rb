N = gets.to_i
R = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
Q = gets.to_i

sorted_r = R.map.with_index{|r,i| [r,i]}.sort!
sorted_c = C.map.with_index{|c,i| [c,i]}.sort!
qmap_r = {}
qmap_c = {}
Q.times do |i|
  r, c = gets.split.map(&:to_i)
  qmap_r[r] ||= []
  qmap_r[r].push i
  qmap_c[c] ||= []
  qmap_c[c].push i
end
results = Array.new Q
qcount = Q

max_r = N
max_c = N
min_r = 0
min_c = 0
change = true 
while(qcount > 0) do
  change = false
  while(sorted_r[-1] && sorted_r[-1][0] >= max_r) do
    r, i = sorted_r.pop
    min_c += 1
    next unless qmap_r[i+1]
    qmap_r[i+1].each do |v|
      unless results[v]
        results[v] = '#'
        qcount -= 1
      end
    end
    change = true
  end
  while(sorted_c[-1] && sorted_c[-1][0] >= max_c) do
    c, i = sorted_c.pop
    min_r += 1
    next unless qmap_c[i+1]
    qmap_c[i+1].each do |v|
      unless results[v]
        results[v] = '#'
        qcount -= 1
      end
    end
    change = true
  end
  while(sorted_r[0] && sorted_r[0][0] <= min_r) do
    r, i = sorted_r.shift
    max_c -= 1
    next unless qmap_r[i+1]
    qmap_r[i+1].each do |v|
      unless results[v]
        results[v] = '.'
        qcount -= 1
      end
    end
    change = true
  end
  while(sorted_c[0] && sorted_c[0][0] <= min_c) do
    c, i = sorted_c.shift
    max_r -= 1
    next unless qmap_c[i+1]
    qmap_c[i+1].each do |v|
      unless results[v]
        results[v] = '.'
        qcount -= 1
      end
    end
    change = true
  end
end

puts results.join('')
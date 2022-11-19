N, M = gets.split.map(&:to_i)
lists = []
h = {}
M.times do |i|
  kx = gets.split.map(&:to_i)
  k = kx.shift
  kx.each do |x|
    h[x] ||=[]
    h[x].push(i)
  end
end

2.upto(N) do |i|
  hi = h[i] || []
  1.upto(i-1) do |j|
    # warn "i:#{i} #{j}"
    next if (hi & (h[j] || [])).size > 0
    puts 'No'
    exit
  end
end
# warn h.inspect
puts 'Yes'
H, W , N = gets.split.map(&:to_i)

irca = []
N.times do |i|
  irca << [i, *gets.split.map(&:to_i)]
end

irca.sort_by!{|x| - x[3]}

ba = 10**10
results = Array.new N

list_h = Array.new H+1, 0
list_w = Array.new W+1, 0
updates = []

irca.each do |i, r, c, a|
  if ba != a
    updates.each do |ur, uc, uans|
      list_h[ur] = uans + 1 if list_h[ur] <= uans
      list_w[uc] = uans + 1 if list_w[uc] <= uans
    end
    updates = []
    ba = a
  end
  rmax = list_h[r]
  cmax = list_w[c]
  ans = [rmax, cmax].max
  results[i] = ans
  updates.push([r,c, ans])
end

results.each do |r|
  puts r 
end
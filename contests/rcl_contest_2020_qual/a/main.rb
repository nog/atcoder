N, W, K, V = gets.split.map(&:to_i)
CV = Array.new(N)
# C, V = Array.new(N), Array.new(N)
N.times do |i|
  CV[i] = gets.split.map(&:to_i)
  # C[i], V[i] = gets.split.map(&:to_i)
end
results = []
field = Array.new(W).map{ Array.new }

X = 5
count = 2000

def calc_point arr, ans
  res = Array.new(W).map{ Array.new }
  arr.each_with_index do |cv, i|
    res[ans[i]].push(cv)
  end

  point = 0
  (arr.size/W).times do |x|
    colors = {}
    res.each do |col|
      c = col[x][0]
      v = col[x][1]
      colors[c] ||= 0
      colors[c] += v
    end
    point += colors.values.max
  end
  point
end

CV.each_slice(W*X) do |mcv|
  base_ans = ((0..(W-1)).to_a * X)
  ans = base_ans
  po = calc_point(mcv, ans)
  count.times do
    nans = base_ans.shuffle
    npo = calc_point(mcv, nans)
    if npo > po
      ans = nans
    end
  end
  results.push(*ans)
end

results.each do |x|
  puts x
end
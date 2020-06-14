h, w, k = gets.split.map(&:to_i)
s = Array.new(h)
h.times do |i|
  s[i] = gets.split.map(&:to_i)
end
result = h * w

(2**(h-1)).times do |bit|
  sep = 0
  smap = Array.new h - 1
  (h-1).times do |i|
    smap[i] = sep
    if sep[i] == 1
      sep += 1
    end
  end
  cnts = Array.new sep + 1
  r = 0
  w.times do |_w|
    h.times do |_h|
      if s[_h][_w] == 1
        cnts[smap[_h]]
      end
    end
  end
  if r < result
    result = r
  end
end
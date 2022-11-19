N, @a, @b = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort

def check r
  c = 0
  A.each do |x|
    if x < r
      c += ((r - x).to_f / @a).ceil
    else
      c -= (x - r) / @b
    end
    return false if c < 0
  end
  return  0 <= c
end

x = (A[0]..A[-1]).bsearch do |r|
  check(r)
end
# warn "x:#{x}"

res = A[-1]
cnt = 0
A.each do |aa|
  if aa <= x
    c = ((x - aa).to_f / @a).ceil
    cnt += c
    xx = aa + (c * @a)
    if xx < res
      res = xx
    end
  else
    c = (aa - x) / @b
    xx = aa - (c * @b)
    if xx < res
      res = xx
    end
  end
end
puts res
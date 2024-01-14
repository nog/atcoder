H, W = gets.split.map(&:to_i)
C = []
H.times do
  C.push(gets.chomp.split(''))
end

list = []

1.upto(H-2) do |h|
  chp = C[h-1]
  ch = C[h]
  chn = C[h+1]
  1.upto(W-2) do |w|
    if ch[w] == '#' && chp[w-1] == '#' && chp[w+1] == '#' && chn[w-1] == '#' && chn[w+1] == '#'
      list.push([h,w])
    end
  end
end

N = [H,W].min
result = Array.new(N, 0)

list.each do |h,w|
  d = 2
  while(true) do
    if h - d < 0 || w - d < 0 || h + d >= H || w + d >= W
      break
    end
    if C[h-d][w-d] == '#' && C[h-d][w+d] == '#' && C[h+d][w-d] == '#' && C[h+d][w+d] == '#'
      d += 1
      next
    else
      break
    end
  end
  result[d-2] += 1
end

puts result.join(' ')
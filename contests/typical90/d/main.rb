H, W = gets.split.map(&:to_i)

AH = Array.new H
rowsum = Array.new H
H.times do |i|
  ah = gets.split.map(&:to_i)
  AH[i] = ah
  rowsum[i] = ah.sum
end

trans_ah = AH.transpose
colsum = Array.new W
W.times do |i|
  colsum[i] = trans_ah[i].sum
end

H.times do |h|
  res = []
  rsum = rowsum[h]
  W.times do |w|
    res.push(rsum + colsum[w] - AH[h][w])
  end
  puts res.join(' ')
end
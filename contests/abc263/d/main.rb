N, L, R = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

sum = 0
sumList = [0]
A.each do |a|
  sum += a
  sumList.push(sum)
end
# warn sumList.inspect
minl = 0
lsumList = [0]
(N).times do |l|
  s1 = (sumList[l+1] - sumList[minl]) + minl * L
  s2 = L * (l+1)
  if s2 < s1
    lsumList.push(s2)
    minl = l+1
  else
    lsumList.push(s1)
  end
end
# warn lsumList.inspect
res = sum
(N+1).times do |r|
  rsum = (N-r) * R
  x = lsumList[r] + rsum
  # warn x
  res = x if x < res
end
puts res
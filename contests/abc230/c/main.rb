N, A, B = gets.split.map(&:to_i)
P, Q, R, S = gets.split.map(&:to_i)

min1 = [1-A, 1-B].max
max1 = [N-A, N-B].min
range1 = min1..max1

min2 = [1-A,B-N].max
max2 = [N-A,B-1].min
range2 = min2..max2

rsrange = R..S

P.upto(Q) do |i|
  k = i - A
  res = ['.'] * (S-R+1)
  if range1.include?(k) 
    j = B + k
    if rsrange.include?(j)
      res[j-R] = '#'
    end
    # warn "a i:#{i} j:#{j} k:#{k}"
  end
  if range2.include?(k)
    j = B - k
    if rsrange.include?(j)
      res[j-R] = '#'
    end
    # warn "b i:#{i} j:#{j} k:#{k}"
  end
  puts res.join('')
end
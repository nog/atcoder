N = gets.to_i
A = gets.split.map(&:to_i)

hash = {}
N.times do |i|
  a = A[i]
  hash[a] ||= []
  hash[a].push(i)
end
keys = hash.keys.sort
ar1 = []
ar2 = []

min = 0

keys.each do |k|
  break if ar2[0] && ar2[0] < k
  if ar2[0] == k
    j = 1
    while(ar2[j] == k)
      j += 1
    end
    break unless ar2[j]
    if ar2[j] < k
      break
    end
  end

  list = hash[k].filter{|j| j >= min }
  next if list.empty?
  kouhans = []
  list.each do |i|
    kouhans.push(A[i+N])
  end

  if ar2.empty?
    min = kouhans.min
    if min <= k
      ar1.push k
      ar2.push min
      break
    else
      ar1.push(*([k]*(list.size)))
      ar2.push(*kouhans)
      min = list.last
    end
  else
    ar1.push(*([k]*(list.size)))
    ar2.push(*kouhans)
    min = list.last
  end
end

puts (ar1 + ar2).join(' ')
N = gets.to_i

n = N.to_s.split('')
count = n.tally
len = n.length
result = 0
1.upto((len+1)/2 ) do |i|
  n.permutation(i) do |a|
    a = a.sort.reverse
    next if a[0] == '0'
    acount = a.tally
    bcount = count.merge(acount){|k, v1, v2| v1 - v2}
    b = []
    bcount.keys.sort.each do |k|
      b.unshift(*([k] * bcount[k]))
    end
    next if b[0] == '0'
    x = a.join('').to_i * b.join('').to_i
    if x > result
      result = x
    end
  end
end

puts result
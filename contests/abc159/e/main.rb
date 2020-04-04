h, w, k = gets.split.map(&:to_i)
s = Array.new(h)
require 'pp'
h.times do |i|
  s[i] = gets.split('').map(&:to_i)
end

sum = Array.new(h){ Array.new(w) }
sum[0][0] = s[0][0]
1.upto(w-1) do |i|
  sum[0][i] = sum[0][i-1] + s[0][i]
end
1.upto(h-1) do |i|
  sum[i][0] = sum[i-1][0] + s[i][0]
  l = s[i][0]
  1.upto(w-1) do |j|
    l += s[i][j]
    sum[i][j] = sum[i-1][j] + l
  end
end

if sum[h-1][w-1] < k
  puts 0
  exit
end

def check sum, hsep, wsep
  before_h = 0
  (h-1).times do |i|
    next unless hsep[i]
    after_h = i + 1
  end
end

result = h * w
[false,true].repeated_permutation(h-1) do |hsep|
  hcount = hsep.count(true)
  hseps = []
  hsep.each_with_index do |v, i|
    hseps.push(i+1) if v
  end
  hseps.push(h)
  bhsep = 0
  is_break = false
  hseps.each do |hsep|
    if (sum[hsep][0] - sum[bhsep][0]) > k
      is_break = true
      break
    end
    bhsep = hsep
  end
  next if is_break
  r = hcount
  bvsep = 0
  is_break = false
  1.upto(w-1) do |i|
    bhsep = 0
    hseps.each do |hsep|
      if (sum[hsep][i] - sum[bhsep][i]) > k
        is_break = true
        break
      end
      c = sum[hsep][i]
      

      bhsep = hsep
    end
    break if is_break
  end
end
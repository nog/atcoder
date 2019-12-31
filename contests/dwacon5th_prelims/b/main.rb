N, K = gets.split(' ').map(&:to_i)
A = gets.split(' ').map(&:to_i)

require 'pp'
def debug obj
  # PP.pp obj, STDERR
end
debug [N,K]
debug A
sum = 0
sumA = A.map{|a| sum += a }
bt_list = []

(0..(N)).to_a.combination(2) do |l,r|
  bt_list.push(((sumA[r] || 0) - sumA[l]).abs)
end

bt_list.sort!.reverse!
debug bt_list

r = 0

max = sumA.last

maxlog = Math.log2(max).to_i
bt_list_size = bt_list.size
maxlog.downto(0) do |i|
  count = 0
  ra = r + (1 << i)
  nbt_list = []
  bt_list.each do |bt|
    if ra == ( ra & bt )
      count += 1
      nbt_list.push(bt)
    end
  end
  if count >= K
    r = ra
    bt_list = nbt_list
  end
end

puts r
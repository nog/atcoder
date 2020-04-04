k = gets.to_i
# 1 2 3 4 5 6 7 8 9
# 10 11 12
# 21 22 23
# 32 33 34
# ...
# 87 88 89
# 98 99
# 101 110 111 121 122 123
# 210 211 221 222 223 232 233 234
list = [[1,2,3,4,5,6,7,8,9]]
while k > list.last.size
  k -= list.last.size
  nlist = []
  list.last.each do |a|
    mod = a % 10
    if mod != 0
      nlist.push(a * 10 + mod - 1)
    end
    nlist.push(a * 10 + mod)
    if mod != 9
      nlist.push(a * 10 + mod + 1)
    end
    list.push(nlist)
  end
end
puts list.last[k-1]
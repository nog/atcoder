N = gets.to_i
C = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)
 
list = []
lc = C[0]
last_list =[]
xhash = Hash.new 0
 
N.times do |i|
  c, x = C[i], X[i]
  xhash[x] += 1
  if c == lc
    last_list.push(x)
  else
    list.push([lc, last_list.sort!])
    last_list =[x]
    lc = c
  end
end
list.push([lc, last_list.sort!])
xlist = xhash.keys.sort!
 
result = 0

while(x = xlist.shift) do
  xc = xhash[x]
  dellist = []
  c = 0
  cc = Hash.new 0
  list.size.times do |i|
    lis = list[i]
    co = lis[0]
    li = lis[1]
    while(li[0] == x) do
      xc -= 1
      li.shift
      result += c - cc[co]
    end
    if li.size == 0
      dellist.push(i)
    end
    c += li.size
    cc[co] += li.size
    break if xc == 0
  end
  dellist.reverse.each do |i|
    list.delete_at(i)
  end

  if x = xlist.pop
    xc = xhash[x]
    dellist = []
    c = 0
    cc = Hash.new 0
    ls = list.size
    list.size.times do |i|
      lis = list[ls-1-i]
      co = lis[0]
      li = lis[1]
      while(li[-1] == x) do
        xc -= 1
        li.pop
        result += c - cc[co]
      end
      if li.size == 0
        dellist.push(ls-1-i)
      end
      c += li.size
      cc[co] += li.size
      break if xc == 0
    end
    dellist.each do |i|
      list.delete_at(i)
    end
  end
end
puts result
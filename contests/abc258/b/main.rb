N = gets.to_i
A= Array.new
N.times do
  A.push(gets.split('').map(&:to_i))
end

DLIST = [
  [1,-1],
  [1,0],
  [1,1],
  [0,-1],
  [0,1],
  [-1,-1],
  [-1,0],
  [-1,1]
]

9.downto(1) do |max|
  list = []
  N.times do |y|
    N.times do |x|
      if A[y][x] == max
        list.push([y,x])
      end
    end
  end
  # warn list.inspect

  next if list.size == 0
  result = 0
  list.each do |y, x|
    DLIST.each do |dy, dx|
      r = []
      N.times do |i|
        r.push(A[(y+(dy*i))%N][(x+(dx*i))%N])
      end
      r = r.join('').to_i
      result = r if r > result
    end
  end
  puts result
  exit
end

raise
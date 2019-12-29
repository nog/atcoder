N,M = gets.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i).sort.reverse
@count = Array.new(A[0]+1,0)
@sumA = []
A.each_with_index do |a,i|
  @count[a] += 1
  @sumA[i] = (@sumA[i-1] || 0) + A[i]
end
A[0].times do |i|
  @count[-i-2] += @count[-i-1]
end

def 点以上取れるパターン数 x
  count = 0
  N.times do |i|
    point = x - A[i]
    if point <= 0
      count += N 
    else
      count += @count[point] || 0
    end
  end
  count
end

left = 0
right = A[0]*2 + 1
while(left+1<right) do
  x = (left + right) >>1
  m = 点以上取れるパターン数(x)
  # p [x, m]
  if m >= M
    left = x
  else
    right = x
  end
end
x = left
m = 点以上取れるパターン数(x)
result = 0

N.times do |i|
  need = x - A[i]
  need = 0 if need <= 0 
  count = @count[need]||0
  if count > 0
    result += @sumA[count-1] + (A[i] * count)
  end
end
result -= (m-M)*x
puts result
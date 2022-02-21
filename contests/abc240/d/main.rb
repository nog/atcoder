N = gets.to_i
A = gets.split.map(&:to_i)

count = 0
stack = [[1,1]]
A.each do |a|
  last = stack[-1]
  s, cnt = last
  if s == a
    if cnt + 1 == a
      stack.pop
      count -= cnt
    else
      last[1] += 1
      count += 1
    end
  else
    stack.push([a,1])
    count += 1
  end
  puts count
end
N = gets.to_i
S = gets.split.map(&:to_i)

list = Array.new N + 2
list[N+1] = (0..S[N-1])
list[N] = (0..S[N-1])
list[N-1] = (0..S[N-1])

list2 = Array.new N + 1
list2[N] = (0..S[N-1])
list2[N-1] = (0..S[N-1])

(N-2).downto(0) do |i|
  s = S[i]
  l2 = list2[i+1]
  min = s - l2.max
  if min < 0
    min = 0
  end
  max = s - l2.min
  if max < 0
    puts 'No'
    # warn list.inspect
    exit
  end
  list[i] = min..max
  bl = list[i+1]
  list2[i] = (bl.min + min)..(bl.max + max)
end

# warn list.inspect
# warn list2.inspect

result = Array.new N+1

xymax = S[0]
xmin = 0
ymin = 0

result = Array.new N+2
sum0 = 0
sum1 = 0
sum2 = 0
N.times do |i|
  s = S[i]
  if (i % 3) == 0
    sum0 += s
    d = sum0 - sum2
    xymax = d if d - xymax < 0
  elsif i % 3 == 1
    sum1 += s
    d = sum1 -sum0
    if d + xmin < 0
      xmin = -d
    end
  else
    sum2 += s
    d = sum2 - sum1
    if d + ymin < 0
      ymin = -d
    end
  end
  bs = s
end

if xmin + ymin > xymax
  puts 'No'
  exit
end

x = xmin
y = ymin
result = Array.new N+1
result[0] = x
result[1] = y
result[2] = S[0] - x - y

1.upto(N-1) do |i|
  r = S[i] - result[i] - result[i+1]
  result[i+2] = r
end

# warn result.inspect


puts 'Yes'
puts result.join(' ')
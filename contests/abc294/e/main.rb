L, N1, N2 = gets.split.map(&:to_i)
vl1 = []
vl2 = []
N1.times do
  vl1.push(gets.split.map(&:to_i))
end
N2.times do
  vl2.push(gets.split.map(&:to_i))
end

n1 = 0
n2 = 0

v1 = nil
v2 = nil

result = 0
while(vl1.size > 0|| vl2.size > 0) do
  if n1 <= n2
    v, c = vl1.shift
    nn1 = n1 + c
    if v2 == v
      result += ([nn1, n2].min - n1)
    end
    v1 = v
    n1 = nn1
  else
    v, c = vl2.shift
    nn2 = n2 + c
    if v1 == v
      result += ([nn2, n1].min - n2)
    end
    v2 = v
    n2 = nn2
  end
end

puts result
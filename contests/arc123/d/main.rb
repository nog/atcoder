N = gets.to_i
A = gets.split.map(&:to_i)

min = nil
max = nil
if A[0] >= 0
  min = 0
  max = A[0]
else
  min = A[0]
  max = 0
end

def calc b
  c = A[0] - b
  result = (b.abs + c.abs)

  1.upto(N-1) do |i|
    a = A[i]
    if b + c == a
    elsif b + c < a
      b = a - c
    else
      c = a - b
    end
    result += (b.abs + c.abs)
  end
  result
end
minres = calc(min)
maxres = calc(max)
mid = (max + min) / 2
midres = calc(mid)

while(mid != max && mid != min) do
  mida = (mid + max) / 2
  midb = (mid + min) / 2
  midares = calc(mida)
  midbres = calc(midb)
  if midares < midres
    max = mid
    maxres = midres
    mid = mida
    midres = midares
  elsif midbres < midres
    min = mid
    minres = midres
    mid = midb
    midres = midbres
  else
    max = mida
    maxres = midares
    min = midb
    minres = midbres
  end
end

puts midres
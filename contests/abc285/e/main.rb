N = gets.to_i 
A = gets.split.map(&:to_i)
a = A[0...N/2]
s = 1

result = 0

while(a.size > 0) do
  dc = (a.count + s)
  r = (a.sum * (N / dc))
  zan = N % dc
  r += a[0...zan].sum

  result = r if r > result
  a.pop 
end
puts result
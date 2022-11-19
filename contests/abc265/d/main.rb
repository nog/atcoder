N, P, Q, R = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
PQR = P + Q + R
x = 0
w = 3
sum = A[0] + A[1] + A[2]
xw = []
while(w<=N) do
  if sum < PQR
    sum += A[w] if w < N
    w += 1
  elsif sum > PQR
    sum -= A[x]
    x += 1
  elsif sum == PQR
    xw.push([x,w])
    sum += A[w] if w < N
    w += 1
  else
    raise
  end
end

if xw.size == 0
  puts 'No'
  exit
end

xw.each do |x, w|
  y = x + 1
  sump = A[x]
  while(sump < P) do
    sump += A[y]
    y += 1
  end
  next if sump != P
  z = w - 1
  sumr = A[z]
  while(sumr < R) do
    z -= 1
    sumr += A[z]
  end
  if sumr == R
    puts 'Yes'
    exit
  end
end

puts 'No'
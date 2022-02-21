A = gets.chomp.split('').map(&:to_i)
B = gets.chomp.split('').map(&:to_i)

acount =  Hash.new(0)
bcount =  Hash.new(0)
i = 0
while(true) do
  a = A[i]
  b = B[i]
  break if !a && !b
  acount[a] += 1 if a
  bcount[b] += 1 if b
  i += 1
end
asize = A.size
bsize = B.size
over = (asize - bsize).abs
overs =[]

if asize > bsize
  if acount[9] >= over
    

N = gets.to_i 
A = gets.split.map(&:to_i)
Q = gets.to_i
LR = []
Q.times do |i|
  l, r = gets.split.map(&:to_i)
  LR.push([l, r])
end

ALR = (A + LR.flatten).uniq.sort
alri = 0
sleeping = false
count = {}
c = 0
b = 0
1.upto(N-1) do |i|
  a = A[i]
  while(ALR[alri] < a) do
    alr = ALR[alri]
    unless count[alr]
      if sleeping
        count[alr] = c + (alr - b)
      else
        count[alr] = c
      end
    end
    alri += 1
  end
  if sleeping
    c += (a - b)
  end
  count[a] = c
  sleeping = !sleeping
  b = a
end

LR.each do |l, r|
  puts count[r] - count[l]
end
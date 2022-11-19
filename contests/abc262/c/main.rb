N = gets.to_i
A = gets.split.map(&:to_i)

r = 0
counts = 0
rcounts = 0

N.times do |i|
  a = A[i]
  if a == (i + 1)
    counts += 1
  elsif A[a-1] == (i+1)
    rcounts += 1
  end
end

r = rcounts / 2
if counts > 1
  r += counts * (counts - 1) / 2
end
puts r
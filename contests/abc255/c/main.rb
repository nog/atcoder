X ,A, D, N = gets.split.map(&:to_i)

first = A
last = A + (N-1) * D
if D < 0
  first, last = last, first
  D = - D
end

if X <= first
  puts first - X
  exit
end

if last <= X
  puts X - last
  exit
end

mod = first % D
xmod = X % D

d = (mod - xmod).abs
puts [D-d, d].min
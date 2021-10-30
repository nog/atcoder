H, W = gets.split.map(&:to_i)

if H == 1 || W == 1
  puts H * W
else
  w = (W+1) / 2
  h = (H+1) / 2
  puts w * h
end
A, B, C , D = gets.split.map(&:to_i)

dcb = D * C - B
if dcb == 0
  puts -1
  exit
end
res = (A.to_f / dcb).ceil
if res > 0
  puts res
else
  puts -1
end
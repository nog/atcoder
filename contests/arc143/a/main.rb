A, B, C = gets.split.map(&:to_i)

res = 0
list = [A,B,C].sort

if list[0] == list[2]
  puts list[0]
  exit
end

if list[0] != list[1]
  d = list[1] - list[0]
  res += d
  list[1] -= d
  list[2] -= d
end

d = list[2] - list[1]
list[0] -= d
list[1] -= d
list[2] -=  2 * d
res += 2 * d

if list[2] < 0
  puts -1
  exit
end

if list[0] < 0
  puts -1
  exit
end

if list[0] == list[2]
  res += list[0]
  puts res
else
  puts -1
end
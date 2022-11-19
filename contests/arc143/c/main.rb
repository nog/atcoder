N, X, Y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

XY = X+Y

win = A.any? do |a|
  ((a - X) % XY) < Y
end

unless win
  puts 'Second'
  exit
end

win = A.all? do |a|
  ((a - X) % XY) < Y || (a % XY) < Y
end

if win
  puts 'First'
else
  puts 'Second'
end
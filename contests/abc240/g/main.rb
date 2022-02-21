N, X, Y, Z = gets.split.map(&:to_i)
MOD = 998244353
abs = X.abs + Y.abs + Z.abs
if N < abs
  puts 0
  exit
end

if (N - abs).odd?
  puts 0
  exit
end
N, M = gets.split.map(&:to_i)
MOD = 998244353
if M == 2
  if N.odd?
    puts 0
  else
    puts 2
  end
  exit
end

puts (M * (M-1).pow(N-3, MOD) * ((M-2) * (M-2) + (M-1))) % MOD
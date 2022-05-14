A, B, C, D = gets.split.map(&:to_i)
if A < C
  puts 'Takahashi'
elsif A > C
  puts 'Aoki'
elsif B <= D
  puts 'Takahashi'
else
  puts 'Aoki'
end
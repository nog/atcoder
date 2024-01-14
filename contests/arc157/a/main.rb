N, A, B, C, D = gets.split.map(&:to_i)

if C == 0 && B == 0
  if A == 0 || D == 0
    puts 'Yes'
  else
    puts 'No'
  end
elsif (C - B).abs <= 1
  puts 'Yes'
else
  puts 'No'
end
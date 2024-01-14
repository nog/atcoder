N = gets.to_i
S = gets.chomp

if S.match(/\|.*\*.*\|/)
  puts 'in'
else
  puts 'out'
end
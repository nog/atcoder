N = gets.to_i
S = gets.chomp.split('')

if N == 2
  puts (S[0] == S[1]) ? 'Yes' : 'No'
  exit
end

if S[0] == 'A' && S[-1] == 'B'
  puts 'No'
else
  puts 'Yes'
end
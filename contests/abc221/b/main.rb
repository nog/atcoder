S = gets.chomp
T = gets.chomp

if S == T
  puts 'Yes'
  exit
end

(S.length - 1).times do |i|
  s = S.dup
  s[i]   = S[i+1]
  s[i+1] = S[i]
  if s == T
    puts 'Yes'
    exit
  end
end

puts 'No'
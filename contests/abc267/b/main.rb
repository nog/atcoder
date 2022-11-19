S = gets.chomp.split('').map(&:to_i)

if S[0] == 1
  puts 'No'
  exit
end

if S[4] == 0
  if(S[3] == 1 || S[1] == 1) && (S[2] == 1 || S[5] == 1)
    puts 'Yes'
    exit
  end
end

if S[1] == 0 && S[7] == 0
  if S[3] == 1 || S[6] == 1
    puts 'Yes'
    exit
  end
end

if S[2] == 0 && S[8] == 0
  if S[5] == 1 || S[9] == 1
    puts 'Yes'
    exit
  end
end

if S[3] == 0 && S[6] == 1
  puts 'Yes'
  exit
end

if S[5] == 0 && S[9] == 1
  puts 'Yes'
  exit
end

puts 'No'
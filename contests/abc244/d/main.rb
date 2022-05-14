S1, S2, S3 = gets.split
T1, T2, T3 = gets.split

if S1 == T1 && S2 == T2 && S3 == T3
  puts 'Yes'
elsif S1 == T1 || S2 == T2 || S3 == T3
  puts 'No'
else
  puts 'Yes'
end
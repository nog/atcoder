S = gets.chomp
if S != S.reverse
  puts "No"
  exit
end

length = S.length
s2 = S[0...(length/2)]
if s2 != s2.reverse
  puts "No"
  exit
end

s3 = S[length...-1]
if s3 != s3.reverse
  puts "No"
  exit
end

puts "Yes"
A, B, C, D = gets.split.map(&:to_i)

if A == B + C + D || B == A + C + D || C == A + B + D || D == A+ B + C
    puts 'Yes'
elsif A+B==C+D || A+C==B+D || A+D == B+C
    puts 'Yes'
else
    puts 'No'
end
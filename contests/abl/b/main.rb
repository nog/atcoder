A, B, C, D = gets.split.map(&:to_i)

if C <= B && B <= D
    puts 'Yes'
elsif C <= A && A <= D
    puts 'Yes'
elsif A <= C && C <= B
    puts 'Yes'
elsif A <= D && D <= B
    puts 'Yes'
else
    puts 'No'
end
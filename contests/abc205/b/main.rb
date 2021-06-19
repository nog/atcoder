N = gets.to_i 
A = gets.split.map(&:to_i)

if A.tally.keys.size == N
    puts 'Yes'
else
    puts 'No'
end
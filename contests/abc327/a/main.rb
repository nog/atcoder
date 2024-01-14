N = gets.to_i
S = gets.chomp

if S.match(/ab/) || S.match(/ba/)
    puts 'Yes'
else
    puts 'No'
end
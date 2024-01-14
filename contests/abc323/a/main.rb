S = gets.chomp

1.upto(8) do |i|
    next if S[(i*2)-1] == "0"
    puts 'No'
    exit
end

puts 'Yes'
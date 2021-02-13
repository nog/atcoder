A, B, C = gets.split.map(&:to_i)

if A > B
    puts "Takahashi"
elsif B > A
    puts "Aoki"
elsif C == 1
    puts "Takahashi"
else
    puts "Aoki"
end
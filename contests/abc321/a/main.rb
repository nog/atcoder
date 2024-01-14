N = gets.chomp.split('').map(&:to_i)

x = 10
N.each do |n|
    if n >= x
        puts 'No'
        exit
    end
    x = n
end

puts 'Yes'
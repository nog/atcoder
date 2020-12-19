S, P = gets.split.map(&:to_i)

res_n = (1..(S/2)).bsearch do |n|
    m = S - n
    n * m >= P
end

unless res_n
    puts "No"
    exit
end

res_m = S - res_n
if res_n * res_m == P
    puts 'Yes'
else
    puts 'No'
end
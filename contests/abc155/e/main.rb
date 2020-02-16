N = gets.chomp
N_list = N.split('').map(&:to_i).reverse

result = 0
(N.length+1).times do |i|
  n = N_list[i]
  break unless n
  if n == 5 &&  N_list[i+1] && N_list[i+1] >= 5
    result += 5
    N_list[i+1] = N_list[i+1] + 1
  elsif n <= 5
    result += n
  elsif n >= 10
    N_list[i+1] ||= 0
    N_list[i+1] = N_list[i+1] + 1
  else
    N_list[i+1] ||= 0
    N_list[i+1] = N_list[i+1] + 1
    result += 10 - n
  end
end

puts result
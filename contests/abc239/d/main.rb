A, B, C, D = gets.split.map(&:to_i)

min = A+C
max = B+D

prime_list = []
require 'prime'
Prime.each(max) do |x|
  next if x < min
  prime_list.push(x)
end



i = 0
A.upto(B) do |x|
  pr = nil
  while((pr = prime_list[i]) && (pr < x+C)) do
    i += 1
  end

  unless pr
    puts 'Takahashi'
    exit
  end
  if pr > x+ D
    # warn x
    puts 'Takahashi'
    exit
  end
end

puts 'Aoki'
N = gets.to_i
A = gets.split.map(&:to_i)

A.each do |a|
  next if a.odd?
  if (a % 5 == 0) || ( a % 3 == 0)
    next
  else
    puts "DENIED"
    exit
  end
end

puts "APPROVED"
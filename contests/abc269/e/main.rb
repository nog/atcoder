N = gets.to_i
range = (1..N)
$stdout.sync = true

i = range.bsearch do |x|
  puts "? 1 #{x} 1 #{N}"
  cnt = gets.to_i
  cnt < x
end
j = range.bsearch do |x|
  puts "? 1 #{N} 1 #{x}"
  cnt = gets.to_i
  cnt < x
end

puts "! #{i} #{j}"
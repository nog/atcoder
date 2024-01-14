N, D = gets.split.map(&:to_i)

if (N-1) < 2 * D
  puts "No"
  exit 
end


list = Array.new(N, 2*D)
result = []
D.times do |d|
  N.times do |i|
    result.push([i,(i+1+d)%N])
    list[i] -= 1
    list[(i+1)%N] -= 1
  end
end

puts 'Yes'
result.each do |l|
  puts l.map{|x| x + 1}.join(' ')
end
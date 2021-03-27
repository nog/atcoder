N = gets.to_i
APX = Array.new N 
result = nil
N.times do |i|
    pa, pp, px = gets.split.map(&:to_i)
    next if pa >= px
    result ||= pp
    result = pp if pp < result
end

puts result || -1
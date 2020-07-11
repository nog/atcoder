N = gets.to_i
S = Array.new N 
res = {}
N.times do |i|
    r = gets.chomp
    res[r] ||= 0
    res[r] += 1
end
["AC", "WA", "TLE", "RE"].each do |r|
    puts "#{r} x #{res[r] || 0}"
end
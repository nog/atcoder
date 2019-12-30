Q = gets.to_i
require 'prime'
require 'pp'

def debug *objs
  PP.pp *objs, STDERR
end
prime_map = {}
target_map = Hash.new(0)
Prime.each(10**5).each do |pri|
  prime_map[pri] = true
  if prime_map[(pri+1)/2]
    target_map[pri] = 1
  end
end

counts = Array.new(10**5+1,0)
1.upto(10**5).each do |i|
  counts[i] = counts[i-1] + target_map[i]
end

debug counts[0,10]

Q.times do |i|
  l, r = gets.split(' ').map(&:to_i)
  puts counts[r] - counts[l-1]
end
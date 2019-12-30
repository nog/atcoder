N = gets.to_i
B = gets.split(' ').map(&:to_i)
b = B
result = []

require 'pp'
def debug obj
  PP.pp obj, STDERR
end

debug "N: #{N}"
debug B
while(b.size > 0) do
  found = false
  b.length.times do |i|
    j = b.length - 1 - i
    if b[j] == j + 1
      found = true
      result.unshift(b.delete_at(j))
      break
    end
  end

  unless found
    puts -1
    exit
  end
end

result.each do |r|
  puts r
end
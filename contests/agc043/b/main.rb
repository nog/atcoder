N = gets.to_i
A = gets.chomp.split('').map(&:to_i)

array = A
while true do
  left = []
  right = []
  size = array.size
  (size / 2).times do |i|
    l = array[i] - array[i+1]
    unless l == 0 && left.size == 0
      left.push(l.abs)
    end
    r = array[size-1-i] - array[size-2-i]
    unless r == 0 && right.size == 0
      right.unshift(r.abs)
    end
  end
  if size.odd?
  else
    right.shift
  end
  array = left + right
  if array.size <= 1
    if array.size == 0
      puts 0
      exit
    elsif array.size == 1
      puts array[0]
      exit
    end
  end
end
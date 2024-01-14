X, Y, Z = gets.split.map(&:to_i)
S = gets.chomp.split('')

off = 0
on = Z

def min a, b
  a < b ? a : b
end

S.each do |s|
  offlist = []
  onlist = []
  if s == "A"
    offlist.push(off + Y)
    onlist.push(on + X)

    offlist.push(on + Z + Y)
    onlist.push(off + Z + X)
  elsif s == "a"
    offlist.push(off + X)
    onlist.push(on + Y)

    offlist.push(on + Z + X)
    onlist.push(off + Z + Y)
  else
    raise
  end
  on = onlist.min
  off = offlist.min
end

puts min on, off
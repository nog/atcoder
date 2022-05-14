L, R = gets.split.map(&:to_i)

if L == 1
  puts R - 1
  exit
end

@max = 0
def calc l, r
  if l.gcd(r) == 1
    @max = r - l
    return @max
  else
    [calc(l+1, r), calc(l, r-1)].max
  end
end

puts calc(L, R)
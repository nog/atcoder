A, B = gets.split.map(&:to_i)

left = 0
right = 10**18

def calc cnt
  (A / ((cnt+1) ** 0.5)) + (cnt * B)
end

left_r = calc(left)
right_r = calc(right)

while(left + 2 < right) do
  # warn "left:#{left} right:#{right}"
  t1 = (2 * left + right) / 3
  t2 = (left + 2 * right) / 3
  t1_r = calc(t1)
  t2_r = calc(t2)
  if t1_r < t2_r
    right = t2
  else
    left = t1
  end
end

puts (left..right).to_a.map{|x| calc(x)}.min
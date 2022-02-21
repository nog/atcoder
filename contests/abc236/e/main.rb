N = gets.to_i
A = gets.split.map(&:to_i)

dpa = Array.new N+1
dpb = Array.new N+1

dpa[0] = [
  [0,0,0],
  [0,0,0]
]

N.times do |i|
  a = A[i]
  bdpa = dpa[i]
  select_kouho = bdpa.map do |bd|
    c = bd[1] + 1
    sum = bd[2] + a
    ave = sum.to_f / (c + (N-i-1)/2)
    [ave, c, sum]
  end
  no_select = bdpa[1]
  warn select_kouho.inspect
  warn select_kouho.max.inspect
  dpa[i+1] = [no_select, select_kouho.max]
end


r = dpa[N].max
puts r[0]
warn dpa.inspect
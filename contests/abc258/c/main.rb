N, Q = gets.split.map(&:to_i)
S = gets.chomp.split('')

start = 0
Q.times do
  q, x = gets.split.map(&:to_i)
  # warn "q:#{q} x:#{x}"
  if q == 1
    start = (start - x) % N
  else
    # warn "start:#{start}"
    puts S[(start+x-1) % N]
  end
end
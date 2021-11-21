Q = gets.to_i
N = 2**20
A = Array.new N, -1

@to = Array.new N, -1

def get_to i
  i = i % N
  ni = i + 1 % N
  to = @to[i]
  if to == -1
    @to[i] =  ni
    i
  else
    @to[i] = get_to(to)
  end
end

Q.times do |i|
  t, x = gets.split.map(&:to_i)
  if t == 1
    to = get_to(x)
    A[to % N] = x
  elsif t == 2
    puts A[x % N]
  else
    raise
  end
end
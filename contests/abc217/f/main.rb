N, M = gets.split.map(&:to_i)
@friends = {}

M.times do
  a, b = gets.split.map(&:to_i)
  @friends[a-1] || = {}
  @friends[a-1][b-1] = true
  @friends[b-1] || = {}
  @friends[b-1][a-1] = true
end

def calc stat
  l = nil
  r = nil
  (2*N).times do |i|
    next if stat[i] == 1
    if l == nil
      l = i
    elsif r == nil
      r = i
      if @friends[l][r]
        nstat = stat + 2**l + 2**r
        calc(nstat)
  end
end
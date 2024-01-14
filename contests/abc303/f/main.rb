N, H = gets.split.map(&:to_i)
@list =[]
N.times do
  t, d = gets.split.map(&:to_i)
  @list.push([t*d, t, d])
end

@list.sort!
@ls = @list.size

res = (1...(10**18)).bsearch do |x|
  i = @ls -1
  h = H
  while(h > 0 && x > 0) do
    td, t, d = @list[i]
    if x > t
      h -= td * (x - (t-1))
      x = t - 1
      next
    end

    dm = x * d
  end
  h <= 0 ? true : false
end

puts res
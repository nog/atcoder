T = gets.to_i

T.times do
  l, r = gets.split.map(&:to_i)
  keta = r.to_s.length
  min = (10 ** (keta - 1))
  # warn "l:#{l} r:#{r} min: #{min}"
  llist = [l]
  llist.push( (r/10) + 1)
  if r.to_s[0] == "1"
    llist.push(r - min + 1) if min != 1
  else
    llist.push(min)
  end
  # warn llist.inspect
  # warn r - llist.max + 1

  puts (r - llist.max) + 1
end
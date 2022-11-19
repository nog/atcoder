N, X, Y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

xpat = {
  A[0] => true
}

ypat = {
  0 => true
}

1.upto(N-1) do |i|
  a = A[i]
  if i.odd?
    nypat = {}
    ypat.keys.each do |by|
      nypat[by+a] = true
      nypat[by-a] = true
    end
    ypat = nypat
  else
    nxpat = {}
    xpat.keys.each do |bx|
      nxpat[bx+a] = true
      nxpat[bx-a] = true
    end
    xpat = nxpat
  end
end


if xpat[X] && ypat[Y]
  puts 'Yes'
else
  puts 'No'
end
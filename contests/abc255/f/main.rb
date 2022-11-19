N = gets.to_i
P = gets.split.map(&:to_i)
I = gets.split.map(&:to_i)

@ipos = {}

@llist = Array.new N+1
@rlist = Array.new N+1

N.times do |i|
  _p = P[i]
  _i = I[i]
  @ipos[_i] = i
end

def calc root, pstart, plast, istart, ilast
  return false if root != P[pstart]
  root_ipos = @ipos[root]
  # warn "root:#{root} root_ipos:#{root_ipos} pstart:#{pstart} plast:#{plast} istart:#{istart} ilast:#{ilast}"
  if pstart == plast
    @llist[root] = 0
    @rlist[root] = 0
    return true
  end

  if root_ipos == istart
    @llist[root] = 0
    rroot = P[pstart+1]
    @rlist[root] = rroot
    # warn "a noleft"
    return calc(rroot, pstart+1, plast, istart+1, ilast)
  end

  lroot = P[pstart+1]
  lcount = root_ipos - pstart
  @llist[root] = lroot
  # warn "b left lcount:#{lcount}"
  return false unless calc(lroot, pstart+1, pstart+lcount, istart, root_ipos-1)
 
  rcount = (plast - pstart) - lcount
  if rcount == 0
    @rlist[root] = 0
    return true
  end
  # warn "c right"
  rroot = P[pstart+lcount+1]
  @rlist[root] = rroot
  return false unless calc(rroot, pstart+lcount+1, plast, root_ipos+1, ilast)
  return true
end


unless calc 1, 0, N-1, 0, N-1
  puts -1
  exit
end

1.upto(N) do |i|
  puts "#{@llist[i]} #{@rlist[i]}"
end
MOD = 998244353
N = gets.to_i
robots = Array.new N 
N.times do |i|
  robots[i] = gets.split.map(&:to_i)
end
robots.sort_by!{|x| x[0] }
notouched = Array.new N

class MaxSegmentTree
  def initialize n, init
    @n = n 
    @init = init
    @offset = 2 ** (Math.log2(n).to_i + 1)
    @tree = Array.new(2*@offset, @init )
  end

  def update pos, val
    pos += @offset
    @tree[pos] = val
    while pos > 1
      pos = pos / 2
      @tree[pos] = max(@tree[2*pos], @tree[2*pos+1])
      break if @tree[pos] > val
    end
  end

  def query l,r 
    l += @offset
    r += @offset
    ret = @init
    while l<=r && ret != N
      ret = max(ret, max(@tree[r], @tree[l]))
      r = (r-1) / 2
      l = (l+1) / 2
    end
    return ret
  end
end

def max a, b 
  a > b ? a : b
end

segtree = MaxSegmentTree.new(N, 0)
dp = Array.new(N + 1)
dp[N] = 1
N.times do |i|
  x = N - 1 - i
  d = robots[x][0] + robots[x][1]
  l = x
  r = N
  unless robots[N-1][0] < d
    while l + 1 < r do
      c = ( l + r ) / 2
      if robots[c][0] >= d
        r = c
      else
        l = c
      end
    end
  end
  ro = r
  if ro  != N
    xro = segtree.query(x+1,ro-1)
    ro = xro if xro > ro
    notouched[x] = ro
    dp[x] = ( dp[x+1] + dp[notouched[x]] ) % MOD
  else
    dp[x] = ( dp[x+1] + 1 )
  end
  segtree.update(x, ro)
end

puts dp[0] % MOD
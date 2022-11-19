N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

AB = []
N.times do |i|
  AB.push([A[i], B[i]])
end

AB.sort!
res = N
ALTB = AB.map{|ab| ab[1]}

class Array
  def lis
    b_ary = [self[0]] 
    self[1..-1].each do |v|
      index = b_ary.bsearch_index { |x| x >= v }
      if index 
        b_ary[index] = v
      else 
        b_ary << v
      end
    end
    return b_ary.size
  end
end
# d = {
#   0 => 0
# }
# def smin a, b
#   a < b ? a : b
# end
# N.times do |i|
#   c = ALTB[i]
#   d.keys.each do |cnt|
#     min = d[cnt]
#     if min + 1 == c
#       d[cnt+1] = smin(d[cnt+1] || N, c)
#       d.delete(cnt)
#     elsif min < c
#       d[cnt+1] = smin(d[cnt+1] || N, c)
#     end
#   end
# end


puts N + ALTB.lis
N,M,V,P = gets.split(' ').map(&:to_i)
A = gets.split(' ').map(&:to_i).sort

require 'pp'
PP.pp [N,M,V,P], STDERR
PP.pp A, STDERR
def check a
  return true if a >= A[-P]
  return false if A[-P] > a + M
  if V <= P
    return A[-P] <= a + M
  end

  point = (V-P) * M
  skip_self = false
  A[0,A.size - (P - 1)].each do |aa|
    if aa == a && !skip_self
      skip_self = true
      next
    end
    if aa <= a
      point -= M
    elsif aa > a && (a+M) > aa
      point -= (a+M-aa)
    end
    return true if point <= 0
  end
  return true if point <= 0
  return point <= 0
end
line = A.bsearch{|a| check a }
puts A.find_all{|a| a >= line}.size
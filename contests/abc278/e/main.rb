H, W, N, h, w = gets.split.map(&:to_i)
A = Array.new(H)
# require 'narray'
require 'matrix'
summap = Array.new(H+1)
zero_counts = Vector.elements(Array.new(N+1, 0))
summap[0] = Array.new(W+1, zero_counts)
H.times do |i|
  line = gets.split.map(&:to_i)
  A[i] = line
  bsumline = summap[i]
  sumline = Vector.elements(Array.new(W+1))
  sumline[0] = zero_counts
  W.times do |w|
    # cnts = bsumline[w].zip(bsumline[w+1], sumline[w]).map{|a,b,c| b + c - a }
    cnts = bsumline[w+1] + sumline[w] - bsumline[w]
    a = line[w]
    cnts[a] += 1
    sumline[w+1] = cnts
  end
  summap[i+1] = sumline
end

# warn summap.inspect

last_counts = summap[-1][-1]
# require 'pp'
# warn summap.pretty_inspect if W < 5
(H-h+1).times do |k|
  ue_line = summap[k]
  sita_line = summap[k+h]
  res_line = []
  (W-w+1).times do |l|
    res = 0

    # if W < 5
    #   warn "k:#{k} l:#{l}"
    #   warn last_counts.inspect
    #   warn sita_line[l+w].inspect
    #   warn ue_line[l].inspect
    #   warn ue_line[l+1].inspect
    # end
    (last_counts - sita_line[l+w] - ue_line[l] + ue_line[l+w] + sita_line[l]).each do |x|
      res += 1 if x > 0
    end
    # last_counts.zip(sita_line[l+w], ue_line[l], ue_line[l+w], sita_line[l]).each do |a, b, c, d, e|
    #   if (a - b - c + d + e) > 0
    #     res += 1
    #   end
    # end
    res_line.push(res)
  end
  puts res_line.join(' ')
end
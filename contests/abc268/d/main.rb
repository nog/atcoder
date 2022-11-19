N, M = gets.split.map(&:to_i)
S = Array.new N
N.times do |i|
  S[i] = gets.chomp
end
@exists = {}
M.times do
  t = gets.chomp
  @exists[t] = true
end

warn @exists.inspect

maxc = (N > 9) ? 9 : N
if N == 1
  S.each do |s|
    next if s.size < 3
    unless @exists[s]
      puts s
      exit
    end
  end
  puts -1
  exit
end

S.permutation(N).each do |l|
  joined = l.join('')
  next if joined.size + l.size - 1 > 16
  min_score_size = l.size - 1
  max_score_size = 16 - joined.size
  min_score_size.upto(max_score_size) do |ss|
    (1..ss).to_a.combination(N-1) do |unscos|
      cos_list = []
      b = 0
      unscos.each do |c|
        cos_list.push("_" * (c-b))
        b = c
      end
      r = []
      (N-1).times do |i|
        r.push(l[i], cos_list[i])
      end
      r.push(l[-1])
      res = r.join('')
      unless @exists[res]
        puts res
        exit
      end
    end
  end
end

puts -1
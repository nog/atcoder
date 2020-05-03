n = gets.to_i
a = gets.split.map(&:to_i)

aa = a.map.with_index do |x, i|
  [i, x]
end

aa = aa.sort_by do |x|
  -x[1]
end

dp = Array.new(n+1)
dp[0] = [[0,aa]]
n.times do |i|
  before = dp[i].sort_by do |x|
    -x[0]
  end
  p "--"
  p before
  before = before[0..1]
  p before
  dp[i+1] = []
  before.each do |xx|
    current_point = xx[0]
    list = xx[1]
    list.each.with_index do |xxx,j|
      point = current_point + (xxx[0] - i).abs * xxx[1]
      if dp[i+1].size < 4 || point >= dp[i+1][3][0]
        new_list = list.dup
        new_list.delete_at(j)
        dp[i+1].push([point, new_list])
        dp[i+1] = dp[i+1].sort_by{|c| -c[0] }
      end
    end
  end
end

puts dp[n][0]
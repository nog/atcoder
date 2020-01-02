N = gets.to_i
S = gets.chomp.split('')
Q = gets.to_i
K = gets.split.map(&:to_i)

require 'pp'
def debug obj
  PP.pp obj, STDERR
end

STRD = 'D'.freeze
STRM = 'M'.freeze
STRC = 'C'.freeze
d_list = []
c_list = []
m_sum = Array.new(N+1, 0)
c_sum = Array.new(N+1, 0)
mc_sum = Array.new(N+1, 0)

S.each_with_index do |s, i|
  d_list.push(i) if s == STRD
  m_sum[i+1] = m_sum[i] + (s == STRM ? 1 : 0)
  c_sum[i+1] = c_sum[i]
  mc_sum[i+1] = mc_sum[i]

  if s == STRC
    c_list.push(i)
    c_sum[i+1] = c_sum[i] + 1
    mc_sum[i+1] = mc_sum[i] + m_sum[i]
  end
end
# debug m_sum
# debug c_sum
# debug mc_sum
Q.times do |q|
  k = K[q]
  result = 0
  d_list.each do |d|
    to = (d + k < N) ? d + k : N
    result += (mc_sum[to] - mc_sum[d]) - (c_sum[to] - c_sum[d]) * m_sum[d]
  end
  puts result
end

N, K = gets.split(' ').map(&:to_i)
R, S, P = gets.split(' ').map(&:to_i)
T = $stdin.read.chomp
# r グー, s チョキ p パー
result = 0
BYTE_R = "r".getbyte(0)
BYTE_S = "s".getbyte(0)
BYTE_X = "!".getbyte(0)
N.times do |i|
  rsp = T.getbyte(i)
  if i < K || rsp != T.getbyte(i-K)
    case rsp
    when BYTE_R
      result += P
    when BYTE_S
      result += R
    else
      result += S
    end
  else
    T.setbyte(i, BYTE_X)
  end
end
puts result
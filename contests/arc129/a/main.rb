N, L, R = gets.split.map(&:to_i)
nblen = N.bit_length

if L.bit_length > N.bit_length
  puts 0
  exit
end
# if R.bit_length > N.bit_length
#   R = (1<<(N.bit_length)) - 1
# end
result = 0

bits = []
(N.bit_length-1).downto(0) do |i|
  _min = nil
  _max = nil
  if N[i] == 1
    _min = (bits.join('') + "1" + ("0" * (nblen - 1 - bits.size))).to_i(2)
    _max = (bits.join('') + "1" + ("1" * (nblen - 1 - bits.size))).to_i(2)
    if _min < L
      _min = L
    end
    if _max > R
      _max = R
    end
    if _max >= L && _min <= R
      result += _max - _min + 1
    end
  end
  bits.push(0)
  # warn "_min:#{_min} max:#{_max}"
  # warn result
  # warn bits.inspect
end

puts result
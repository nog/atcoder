ARG_N, ARG_K, ARG_S = gets.split.map(&:to_i)

result = Array.new ARG_N
ARG_N.times do |i|
  if i < ARG_K
    result[i] = ARG_S
  else
    if ARG_S == 10**9
      result[i] = 1
    else
      result[i] = ARG_S+1
    end
  end
end
puts result.join(" ")
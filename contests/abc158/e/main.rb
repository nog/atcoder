N, P = gets.split.map(&:to_i)
S = gets.chomp.split('')
result = 0
if P == 2
  S.length.times do |i|
    if S[i].to_i.even?
      result += i + 1
    end
  end
  puts result
  exit
end

if P == 5
  S.length.times do |i|
    if [5,0].include?(S[i].to_i)
      result += i + 1
    end
  end
  puts result
  exit
end

mod_counts = {}
mods = []
s_length = S.length
mod_counts[0] = 1
mod = 0

@fact10 = {}
def fact10 x
  return 1 if x == 0
  unless @fact10[x]
    @fact10[x] = (fact10(x-1) * 10) % P
  end
  @fact10[x]
end
s_length.times do |i|
  target = S[(s_length - 1 -i)].to_i
  mod = (mod + target * fact10(i)) % P
  if mod_counts[mod]
    result += mod_counts[mod]
    mod_counts[mod] += 1
  else
    mod_counts[mod] = 1
  end
end

puts result
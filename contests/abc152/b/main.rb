ARG_A, ARG_B = gets.split.map(&:to_i)

if ARG_A < ARG_B
  puts ARG_A.to_s * ARG_B
else
  puts ARG_B.to_s * ARG_A
end
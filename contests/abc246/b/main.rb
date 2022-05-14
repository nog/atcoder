A, B = gets.split.map(&:to_i)

dis = (A * A + B * B) ** 0.5

puts [A.to_f / dis, B.to_f / dis].join(' ')
N, M, d = gets.split.map(&:to_i)
D = d * 10
R = gets.split.map(&:to_i).map{|x| x * 10 }
S = gets.split.map(&:to_i)

# warn R.inspect
# warn D
result = 0
# starts = [
#   [D, -D, S[0], N-1],
#   [R[0] % D, (R[0] % D) - D, 0, N],
#   [D/2, -D/2, 0, N]
# ]

starts = []
R.map{|r| r % (D / 2) }.uniq.sort.each do |r|
  starts.push(
    [r, r -D, 0, N]
  )
end

edge = R[-1]
starts.each do |posi, neg, point, n|
  # warn "start posi:#{posi} neg:#{neg} point:#{point}"
  neg = - neg
  targets = []
  posi_score_index = 1
  neg_score_index = 1
  while(R[posi_score_index] < posi) do
    posi_score_index += 1
  end
  while(R[neg_score_index] < neg) do
    neg_score_index += 1
  end

  while(n > 0 && (posi <= edge || neg <= edge)) do
    if posi <= neg
      nposi = R[posi_score_index]
      # warn "posi:#{posi} nposi:#{nposi}"
      num = ((nposi - posi) / D) + 1
      num = n if num > n
      point += S[posi_score_index-1] * num
      posi += D * num
      while(R[posi_score_index] && R[posi_score_index] < posi) do
        posi_score_index += 1
      end
      n -= num
    else
      nneg = R[neg_score_index]
      num = ((nneg - neg) / D) + 1
      num = n if num > n
      point += S[neg_score_index-1] * num
      neg += D * num
      while(R[neg_score_index] && R[neg_score_index] < neg) do
        neg_score_index += 1
      end
      n -= num
    end
    result = point if point > result
  end
  # warn "end pos: #{posi} nega:#{neg} point:#{point}"
end

puts result
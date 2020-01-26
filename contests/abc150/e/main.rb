ARG_N= gets.to_i
ARG_C= gets.split.map(&:to_i).sort
MOD = 10**9+7
MAX=ARG_N+1
n = 0
score =0
pet = 2**(2*ARG_N-1) % MOD
while n < ARG_N do
  score = (score + ARG_C[n] * ( ARG_N - n )) % MOD
  n+=1
end
puts score * pet % MOD
# 高橋君のレートを計算するメソッド
def calculate_rate(performances, k)
    weighted_sum = 0.0
    decay_factor_sum = 0.0
    (0...k).each do |i|
      decay_factor = (0.9 ** (k - i - 1))
      weighted_sum += decay_factor * performances[i]
      decay_factor_sum += decay_factor
    end
    weighted_average = weighted_sum / decay_factor_sum
    rate = weighted_average - (1200.0 / Math.sqrt(k))
    rate
  end
  
  # DPテーブルを初期化
  def init_dp(n)
    Array.new(n) { -Float::INFINITY }
  end
  
  # DPを用いて最大のレートを計算
  def max_rate(n, performances)
    # DPテーブル：dp[i]はi個のコンテストを選んだときの最大レート
    dp = init_dp(n + 1)
    dp[0] = -1200.0
  
    (1..n).each do |i|
      (i).downto(1) do |j|
        dp[j] = [dp[j] || -1200, (((dp[j-1] + (1200.0 / (j > 1 ? Math.sqrt(j-1) : 1)))*@bunbo[j-1]) + performances[i-1]*(0.9**(j-1)))/@bunbo[j] - (1200 / Math.sqrt(j))].max
      end
    end
  
    warn dp.inspect
    dp.max
  end

  # 標準入力からデータを読み込む
  n = gets.to_i
  performances = gets.split.map(&:to_i).reverse
  @bunbo = [1,1]
  x = 1
  2.upto(n) do |k|
    x *= 0.9
    @bunbo.push(@bunbo[-1] + x)
  end
  
 warn @bunbo.inspect 
  # 最大レートを計算して出力
  puts max_rate(n, performances)
  
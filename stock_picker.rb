def stock_picker(stocks)
  return unless stocks.length >= 2
  best_pair = [0, 1]
  stocks.each_with_index do |_, index|
    for i in (index + 1)..stocks.length - 1
      current_stocks = stocks[i] - stocks[index]
      actual_stocks = stocks[best_pair[1]] - stocks[best_pair[0]]
      best_pair = [index, i] if current_stocks > actual_stocks
    end
  end
  best_pair.to_s
end

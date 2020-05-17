module OrdersHelper
  def totalQty(line_items)
    array = line_items.target.map{ |o| o[:quantity]}
    array.sum
  end
end

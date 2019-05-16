require 'pry'
class CashRegister

  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = []
  end

  def add_item(title, price, quantity=1)
    @last_transaction << title
    @last_transaction << price*quantity
    @last_transaction << quantity
    @total += price*quantity
    if quantity == 1
      @items << title
    else
      while quantity > 0
        @items << title
        quantity -= 1
      end
    end
  end

  def apply_discount
    if @discount > 0
      @total = @total - (@total*@discount/100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    if @last_transaction.include?(@items.pop)
      @total -= @last_transaction[1]
    else
      "There are no previous transactions"
    end
  end

end

class Calculator

    def initialize
        @orders = []
        @profit = 0
    end

    def profit()
        compute_profit(@orders)
    end

    def compute_profit(orders)
        return 0 if orders.size == 0
        profit1 = orders[0].price + compute_profit(orders
                   .select { |o| o.compatible(orders[0]) })
        profit2 = compute_profit(orders.drop(1))
        profit1>profit2 ? profit1 : profit2 
    end

    def add_order(order)
        @orders << order
    end
end

class Order
    attr_reader :start, :duration, :price

    def initialize(start, duration, price)
        @start = start
        @duration = duration
        @price = price
    end

    def end_time
        @start + @duration
    end
    def compatible(other)
        @start >= other.end_time
    end
end

class Scheduler
end

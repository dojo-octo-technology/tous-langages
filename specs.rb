require_relative "./lags"

describe "a profit calculator" do
    
    subject(:calculator) { Calculator.new }

    it "should give zero when no order given" do
        expect(calculator.profit).to eq 0
    end
    it "given one order, should yield this order price" do
        calculator.add_order(Order.new(3, 7, 140))
        expect(calculator.profit).to eq 140 
    end

    context "given two colliding orders, yield the best price" do

        specify do
            calculator.add_order(Order.new(3, 7, 140))
            calculator.add_order(Order.new(0, 5, 100))
            expect(calculator.profit).to eq 140 
        end
        specify do
            calculator.add_order(Order.new(5, 9, 80))
            calculator.add_order(Order.new(6, 9, 70))
            expect(calculator.profit).to eq 80 
        end
    end
    it "when given two compatible orders, yield the sum of prices" do
        calculator.add_order(Order.new(0, 5, 100))
        calculator.add_order(Order.new(5, 9, 80))
        expect(calculator.profit).to eq 180 
    end
    it "should pass the demo case" do
        calculator.add_order(Order.new(0, 5, 100))
        calculator.add_order(Order.new(3, 7, 140))
        calculator.add_order(Order.new(5, 9, 80))
        calculator.add_order(Order.new(6, 9, 70))
        expect(calculator.profit).to eq 180 
    end


end

describe "a scheduler" do
    it "should generate 2 actions for every order" do
        scheduler = Scheduler.new()
        scheduler.add_order(Order.new(3,7,140))
        expect(scheduler.actions.size).to eq 2
        expect(scheduler.actions[0].time).to eq 3
        expect(scheduler.actions[0].type).to eq "R"
        expect(scheduler.actions[0].price).to eq 140
        expect(scheduler.actions[1].time).to eq 10
        expect(scheduler.actions[1].type).to eq "C"
    end
end

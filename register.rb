class Register

  def validate_input(input)
    input =~ /\A\$?\d+(.\d{1,2})?\z/
  end

  def get_the_price
    puts "What is the price? (Enter a valid dollar amount)"
    @price = gets.chomp
    (validate_input(@price)) ? get_the_tendered : get_the_price
  end

  def get_the_tendered
    puts "What is the tendered amount?"
    @tendered = gets.chomp
    (validate_input(@tendered)) ? validate_amount(@price, @tendered) : get_the_tendered
  end

  def calculate(tendered, price)
    puts "
    ===Thank You!===
    The total change due is $ #{tendered.to_f - price.to_f}
    #{Time.now}
    ================"
  end

  def validate_amount(price, tendered)
    if @tendered.to_f < @price.to_f
      puts "Not enough! You still owe #{sprintf('$%0.2f', price.to_f - tendered.to_f)}" 
      get_the_tendered
    else 
      calculate(@tendered, @price)
    end
  end

end

x = Register.new
x.get_the_price
x.validate_input
x.validate_amount
check_input

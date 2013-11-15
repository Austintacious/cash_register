public
def validate_type?(input)
  if (input.is_a?(Fixnum) ^ input.is_a?(Float)) != true
    puts "Wrong type of input"
  else
    return input.to_f
  end
end

public
def validate_decimal?(input)
  if !(input.to_s =~ (/\A\$?\d+(.\d{1,2})?\z/))
    puts "Wrong type of input"
  else
    return input
  end
end

public
def get_the_price
  puts "What is the price?"
  $price = gets.chomp
end

public
def get_the_tendered
  puts "What is the tendered amount?"
  $tendered = gets.chomp
end

public
def validate_amount(price, tendered)
  if tendered < price
    puts "Not enough! You still owe #{(amount - given).round(2)}"
  else
    puts "===Thank You!===
    The total change due is $ #{given - amount}
    #{Time.now}
    ================"
  end
end

def check_input
  if get_the_price.validate_type?($price).validate_decimal?($price)
    get_the_tendered.validate_type($tendered).validate_decimal($tendered).validate_amount($price, $tendered)
  else
    check_input
  end
end


check_input

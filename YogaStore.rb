@in_shopping_cart = 0
@price_total = 0
@found = false
@shopping_cart = []
@products = [
  { reference_number: 1231, name: "Super Lite Mat", price: 10 },
  { reference_number: 1232, name: "Power Mat", price: 20 },
  { reference_number: 1233, name: "Block", price: 30 },
  { reference_number: 1234, name: "Meditation cushion", price: 30 },
  { reference_number: 1235, name: "The best T-shirt", price: 200 },
  { reference_number: 1236, name: "The cutest yoga pants", price: 300 },
  { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
  { reference_number: 1238, name: "Light On Yoga", price: 10 }
]


def show_list(products)
  products.each do |product|
    puts "#{product[:reference_number]}\t#{product[:name]}\t#{product[:price]} euro"
  end
  puts "To add something in your shopping cart, just type in the reference number."
  @user_input = gets.chomp.to_i
end

def add_to_cart
  found = false
  @products.each do |product|
    if product[:reference_number] == @user_input
      found = true
      @shopping_cart << product
      @in_shopping_cart += 1
      @price_total += product[:price]
    end
  end
    if found == false
      puts "We could not find what you were looking for."
      show_list(@products)
      add_to_cart
    end
  show_cart(@shopping_cart)
  continue
end

def show_cart(cart_items)
  cart_items.each do |item|
    puts "#{item[:reference_number]}\t#{item[:name]}\t#{item[:price]} euro"
  end
  puts "items:  #{@in_shopping_cart}\ttotal: #{@price_total} euro"
end

def continue
  puts "Do you want to continue shopping? (Y / N)"
  continue_shopping = gets.chomp.upcase

  if continue_shopping == "Y"
    show_list(@products)
    add_to_cart
  else
    puts "That will be #{@price_total} euro. Thank you for shopping here!"
  end
end

# START APP

puts "Welcome to our store! Here is a list of all our products."

show_list(@products)
add_to_cart

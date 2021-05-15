# RubyFoodCourt

@inventory1 = [
  { id: 1, name: "Main: Waffle Platter Special", price: 12 },
  { id: 2, name: "Appetizer: Pocket Eggo", price: 6 },
  { id: 3, name: "Dessert side: 3 Musketeers Sundae", price: 4 },
  { id: 4, name: "Drink: Coke", price: 2 }
];
  @inventory2 = [
    { id: 5, name: "Main: Eleven’s First French Fry Special", price: 12 },
    { id: 6, name: "Appetizer: Hopper's Doughnut and Coffee", price: 6 },
    { id: 7, name: "Dessert side: A Quart of Strawberry Ice Cream", price: 4 },
    { id: 8, name: "Drink: Red Slushie", price: 2 }
]

@shopping_cart = []
###### Main Menu function ######
def main_menu
  puts "Welcome to Starcourt Food Court Choose an option below 👇:
          1. Go Order from Eggo's Menu
          2. Go Order from Upsidedown's Menu
          3. View Cart
          4. Exit
  "
  user_input = gets.chomp.to_i
  if user_input == 1
    eggo_shopping_menu
  elsif user_input == 2
    upsidedown_shopping_menu
  elsif user_input == 3
    cart_menu
  elsif user_input == 4
    puts "Thank you for visiting Starcourt Food court!"
    exit
  else
    puts "That is not a valid option please try agian."
    main_menu
  end
end

##### eggo functions ######
def eggo_shopping_menu
  puts ""
  puts "Eggo's Menu"
  puts "------------------------"
  puts "Choose from below 👇:
          1. View available products
          2. View cart
          3. Return to Main Menu
  "
  puts ""
  user_input = gets.chomp.to_i
  if user_input == 1
    item_selection_menu1
  elsif user_input == 2
    cart_menu
  elsif user_input == 3
    main_menu
  end
end
def item_selection_menu1
  puts ""
  puts "Select a product below to add to cart:"
  puts ""
  # Loop through inventory and show all products and prices
  @inventory1.each_with_index do |v, i|
    puts "#{i + 1}. #{v[:name]} - $#{v[:price]}.00"
  end
  user_input_choice = gets.chomp.to_i
  puts ""
  puts "Type number of items to add to cart:"
  puts ""
  user_input_number = gets.chomp.to_i
  @inventory1.each_with_index do |v, i|
    if user_input_choice == (i + 1)
      user_input_number.times do
        @shopping_cart.push(v)
      end
    end
  end
  eggo_shopping_menu
end

##### upsidedown function ######
def upsidedown_shopping_menu
  puts ""
  puts "Upsidedown's Menu"
  puts "------------------------"
  puts "Choose from below 👇:
          1. View available products
          2. View cart
          3. Return to Main Menu
  "
  puts ""
  user_input = gets.chomp.to_i
  if user_input == 1
    item_selection_menu2
  elsif user_input == 2
    cart_menu
  elsif user_input == 3
    main_menu
  end
end
def item_selection_menu2
  puts ""
  puts "Select a product below to add to cart:"
  puts ""
  # Loop through inventory and show all products and prices
  @inventory2.each_with_index do |v, i|
    puts "#{i + 2}. #{v[:name]} - $#{v[:price]}.00"
  end
  user_input_choice = gets.chomp.to_i
  puts ""
  puts "Type number of items to add to cart:"
  puts ""
  user_input_number = gets.chomp.to_i
  @inventory2.each_with_index do |v, i|
    if user_input_choice == (i + 2)
      user_input_number.times do
        @shopping_cart.push(v)
      end
    end
  end
  upsidedown_shopping_menu
end
def cart_menu
  cart_total = 0
  puts ""
  puts "Your Shopping Cart"
  puts "------------------"
  puts "Current Items in cart:"
  puts ""
  @shopping_cart.each_with_index do |v, i|
    puts "#{i + 0}. #{v[:name]} - $#{v[:price]}.00"
    cart_total += v[:price]
  end
  puts "------------------"
  puts "Cart Total: $#{cart_total}.00"
  puts ""
  puts "Do you want to remove an item? y/n"
  puts ""
  user_input_remove = gets.chomp
  user_input_remove == "y" ? remove_item_from_cart : return_to_main_menu(:cart_menu)
end
def remove_item_from_cart
  puts ""
  puts "Type the item number you want to remove:"
  user_input = gets.chomp.to_i
  @shopping_cart = @shopping_cart.select.with_index do |v, i|
    (i + 1) != user_input
  end
  cart_menu
end
def return_to_main_menu(current_menu)
  puts ""
  puts "Return to Main Menu? y/n"
  puts ""
  user_input = gets.chomp
  if user_input == "y"
    main_menu
  else
    method(current_menu).call
  end
end
main_menu

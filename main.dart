import 'dart:io';

class MenuItem {
  String name;
  double price;

  MenuItem(this.name, this.price);
}

class OrderItem {
  MenuItem menuItem;
  int quantity;

  OrderItem(this.menuItem, this.quantity);
}

class Restaurant {
  List<MenuItem> menu = [];
  List<MenuItem> order = [];

  void addMenuItem(String name, double price) {
    menu.add(MenuItem(name, price));
    print("Menu item added: $name - \$${price.toStringAsFixed(2)}");

  }
  void displayMenu() {
    print("\nMenu:");
    for (var item in menu) {
      print("${item.name} - \$${item.price.toStringAsFixed(2)}");
    }
    print("");
  }

 void placeOrder(String itemName, int quantity) {
  var menuItem = menu.firstWhere((item) => item.name == itemName, orElse: () => MenuItem('', 0.0));
  if (menuItem.name.isNotEmpty) {
  orders.add(OrderItem(menuItem, quantity));
    print('Order placed: $quantity x $itemName');
  } else {
    print('Menu item not found: $itemName');
  }
}

   void displayOrderSummary() {
    if (Orders.isEmpty) {
      print('No orders placed yet.');
    } else {
      print('\nOrder Summary:');
      for (var order in orders) {
        print('${order.quantity} x ${order.menuItem.name} - \$${(order.menuItem.price * order.quantity).toStringAsFixed(2)}');
      }

      var totalAmount = orders.fold(0.0, (sum, order) => sum + order.menuItem.price * order.quantity);
      print('\nTotal Amount: \$${totalAmount.toStringAsFixed(2)}\n');
    }
  }
}

void main() {
  var restaurant = Restaurant();

  // Adding menu items
  restaurant.addMenuItem("Burger", 8.99);
  restaurant.addMenuItem("Pizza", 12.99);
  restaurant.addMenuItem("Salad", 6.49);
  restaurant.addMenuItem("karahi", 14.99);
  restaurant.addMenuItem("Drink", 5.59);

 while (true) {
    print('1. Display Menu');
    print('2. Place Order');
    print('3. Display Order Summary');
    print('4. Exit');
    stdout.write('Enter your choice: ');
    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        restaurant.displayMenu();
        break;
      case 2:
        stdout.write('Enter item name: ');
        var itemName = (stdin.readLineSync()!);
        stdout.write('Enter quantity: ');
        var quantity = int.parse(stdin.readLineSync()!);
        restaurant.placeOrder(itemName , quantity);
        break;
      case 3:
        restaurant.displayOrderSummary();
        break;
      case 4:
        print('Exiting the restaurant management system.');
        exit(0);
        break;
      default:
        print('Invalid choice. Please enter a valid option.');
    }
  }
}
void main() {
  // List of item prices
  List<double> itemPrices = [5.0, 15.0, 20.0, 8.0, 12.0, 30.0];

  // Step 1: Filter out items under $10 using an anonymous function
  List<double> filteredItems = itemPrices.where((price) => price >= 10.0).toList();
  print("Filtered Items (prices >= \$10): $filteredItems");

  // Step 2: Function to calculate the total price with an optional tax parameter
  double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
    double subtotal = prices.reduce((sum, price) => sum + price);
    double total = subtotal + (subtotal * taxRate);
    return total;
  }

  // Step 3: Higher-order function to apply a discount
  List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
    return prices.map((price) => discountFunction(price)).toList();
  }

  // Example discount function: 20% off
  double discountFunction(double price) => price * 0.8;

  // Step 4: Recursive function to calculate a factorial discount
  int calculateFactorial(int n) {
    if (n <= 1) return 1;
    return n * calculateFactorial(n - 1);
  }

  double calculateFactorialDiscount(int itemCount) {
    int factorial = calculateFactorial(itemCount);
    return factorial.toDouble(); // Convert to double for percentage calculation
  }

  // Step 5: Apply the discount and calculate the final total
  List<double> discountedPrices = applyDiscount(filteredItems, discountFunction);
  print("Prices after discount: $discountedPrices");

  // Calculate total price with a 5% tax
  double totalWithTax = calculateTotal(discountedPrices, taxRate: 0.05);
  print("Total with tax: \$${totalWithTax.toStringAsFixed(2)}");

  // Step 6: Apply the special factorial discount
  double specialDiscount = calculateFactorialDiscount(filteredItems.length);
  double finalPrice = totalWithTax * (1 - (specialDiscount / 100));
  print("Final price after special factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}

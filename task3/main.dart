double calculateDiscount(double price, double discountPercent) {
  if (price < 0 || discountPercent < 0 || discountPercent > 100) {
    throw ArgumentError('Invalid input values');
  }
  return price - (price * (discountPercent / 100));
}

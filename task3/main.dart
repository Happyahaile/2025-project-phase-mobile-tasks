double calculateDiscount(double originalPrice, double discountPercentage) {
  if (originalPrice < 0 || discountPercentage < 0 || discountPercentage > 100) {
    throw ArgumentError('Invalid input values');
  }
  return originalPrice - (originalPrice * (discountPercentage / 100));
}

import 'main.dart';

void main() {
  // Valid cases
  print(calculateDiscount(100, 10));  // Expected: 90.0
  print(calculateDiscount(50, 20));   // Expected: 40.0
  print(calculateDiscount(200, 0));   // Expected: 200.0
  print(calculateDiscount(100, 100)); // Expected: 0.0

  // Error cases
  try {
    calculateDiscount(-50, 10);
  } catch (e) {
    print(e); // Expected: ArgumentError
  }

  try {
    calculateDiscount(100, 120);
  } catch (e) {
    print(e); // Expected: ArgumentError
  }
}

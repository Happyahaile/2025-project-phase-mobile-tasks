import 'main.dart';

void main() {
  print(calculateDiscount(100, 10)); // Expected output: 90.0
  print(calculateDiscount(50, 20));  // Expected output: 40.0
  print(calculateDiscount(200, 0));  // Expected output: 200.0
  print(calculateDiscount(100, 100)); // Expected output: 0.0
}

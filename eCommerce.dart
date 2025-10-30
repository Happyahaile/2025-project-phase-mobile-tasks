import 'dart:io';

class Product {
  var name;
  var description;
  var price;
  var image;
  bool isCompleted = false;

  Product({
    this.name,
    this.description,
    this.price,
    this.image,
  });
}

class ProductManager{
  List<Product> products = [];

  // Add a new product
  bool addProduct(Product product) {
    products.add(product);
    return true;
  }

  // Remove a product
  bool removeProduct(Product product) {
    return products.remove(product);
  }

  // Get all products
  List<Product> getAllProducts() {
    return products;
  }

  // Find a product by name
  Product? getProductByName(String name) {
  for (var product in products) {
      if (product.name.toLowerCase() == name.toLowerCase()) {
        return product;
      }
    }
    return null; // not found
  }

  // Update a product
  bool updateProduct(int indexOfProduct, Product updatedProduct) {
    products[indexOfProduct] = updatedProduct;
    return true;
  }
  // View all products
  List<Product> viewAllProducts() {
    return products;
  }

  // View only completed products
  List<Product> viewCompletedProducts() {
    return products.where((product) => product.isCompleted).toList();
  }

  // View only pending products
  List<Product> viewPendingProducts() {
    return products.where((product) => !product.isCompleted).toList();
  }  
}
void main() {
  var manager = ProductManager();

  while (true) {
    print('\n=== E-Commerce Menu ===');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Completed Products');
    print('4. View Pending Products');
    print('5. Update Product');
    print('6. Remove Product');
    print('0. Exit');

    stdout.write('Enter your choice: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _addProduct(manager);
        break;

      case '2':
        _viewProducts(manager.viewAllProducts(), 'All Products');
        break;

      case '3':
        _viewProducts(manager.viewCompletedProducts(), 'Completed Products');
        break;

      case '4':
        _viewProducts(manager.viewPendingProducts(), 'Pending Products');
        break;

      case '5':
        _updateProduct(manager);
        break;

      case '6':
        _removeProduct(manager);
        break;

      case '0':
        print('Goodbye!');
        return;

      default:
        print('Invalid choice. Try again.');
    }
  }
}

// Helper Functions 

// Add product
void _addProduct(ProductManager manager) {
  stdout.write('Enter product name: ');
  var name = stdin.readLineSync();

  stdout.write('Enter description: ');
  var description = stdin.readLineSync();

  stdout.write('Enter price: ');
  var price = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  stdout.write('Enter image name: ');
  var image = stdin.readLineSync();

  stdout.write('Is it completed? (y/n): ');
  var completed = (stdin.readLineSync()?.toLowerCase() == 'y');

  var product = Product(
    name: name,
    description: description,
    price: price,
    image: image,
  )..isCompleted = completed;

  manager.addProduct(product);
  print('✅ Product added successfully.');
}

// View products
void _viewProducts(List<Product> products, String title) {
  print('\n--- $title ---');
  if (products.isEmpty) {
    print('No products found.');
    return;
  }
  for (var i = 0; i < products.length; i++) {
    var p = products[i];
    print('${i + 1}. ${p.name} | \$${p.price} | ${p.isCompleted ? 'Completed' : 'Pending'}');
  }
}

// Update product
void _updateProduct(ProductManager manager) {
  _viewProducts(manager.getAllProducts(), 'All Products');

  stdout.write('Enter the product name to update: ');
  var name = stdin.readLineSync();

  var product = manager.getProductByName(name ?? '');
  if (product == null) {
    print('❌ Product not found.');
    return;
  }

  stdout.write('Enter new name (leave blank to keep "${product.name}"): ');
  var newName = stdin.readLineSync();
  if (newName != null && newName.isNotEmpty) product.name = newName;

  stdout.write('Enter new description (leave blank to keep current): ');
  var newDesc = stdin.readLineSync();
  if (newDesc != null && newDesc.isNotEmpty) product.description = newDesc;

  stdout.write('Enter new price (leave blank to keep ${product.price}): ');
  var newPriceInput = stdin.readLineSync();
  if (newPriceInput != null && newPriceInput.isNotEmpty) {
    var newPrice = double.tryParse(newPriceInput);
    if (newPrice != null) product.price = newPrice;
  }

  stdout.write('Is it completed? (y/n): ');
  product.isCompleted = (stdin.readLineSync()?.toLowerCase() == 'y');

  print('✅ Product updated successfully.');
}

// Remove product
void _removeProduct(ProductManager manager) {
  _viewProducts(manager.getAllProducts(), 'All Products');

  stdout.write('Enter the product name to remove: ');
  var name = stdin.readLineSync();

  var product = manager.getProductByName(name ?? '');
  if (product == null) {
    print('❌ Product not found.');
    return;
  }

  manager.removeProduct(product);
  print('🗑️ Product removed successfully.');
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cartproduct.dart';
import '../models/model.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String searchQuery = '';
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Electronics',
    'Accessories',
    'Wearable',
    'Camera',
  ];

  final products = [
    Product(
      id: '1',
      name: 'Mac Book Gaming',
      price: 15000000,
      imageUrl:
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=1171&auto=format&fit=crop',
      description: 'Laptop gaming',
      category: 'Electronics',
    ),
    Product(
      id: '2',
      name: 'iPhone Pro Max',
      price: 8000000,
      imageUrl:
          'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aXBob25lfGVufDB8fDB8fHww',
      description: 'Smartphone',
      category: 'Electronics',
    ),
    Product(
      id: '3',
      name: 'Iphone Headphones',
      price: 1500000,
      imageUrl:
          'https://images.unsplash.com/photo-1588423771073-b8903fbb85b5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGFpcnBvZHN8ZW58MHx8MHx8fDA%3D',
      description: 'Headphones',
      category: 'Accessories',
    ),
    Product(
      id: '4',
      name: 'Smart Watch',
      price: 3000000,
      imageUrl:
          'https://images.unsplash.com/photo-1637160151663-a410315e4e75?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Watch',
      category: 'Wearable',
    ),
    Product(
      id: '5',
      name: 'Camera Canon 23',
      price: 12000000,
      imageUrl:
          'https://images.unsplash.com/photo-1655762019268-fc8a4220506d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtZXJhJTIwY2Fub258ZW58MHx8MHx8fDA%3D',
      description: 'Camera',
      category: 'Camera',
    ),
    Product(
      id: '6',
      name: 'Keyboard Mechanical',
      price: 7000000,
      imageUrl:
          'https://images.unsplash.com/photo-1587829741301-dc798b83add3?q=80&w=1170&auto=format&fit=crop',
      description: 'Keyboard',
      category: 'Electronics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      final matchName = product.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final matchCategory = selectedCategory == 'All'
          ? true
          : product.category == selectedCategory;

      return matchName && matchCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search product...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonFormField(
              initialValue: selectedCategory,
              items: categories
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),

          const SizedBox(height: 5),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      /// 🔥 IMAGE FROM INTERNET
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,

                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },

                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported);
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              product.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rp ${product.price.toStringAsFixed(0)}',
                              style: TextStyle(color: Colors.green[700]),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<CartModel>().addItem(product);
                                },
                                child: const Text('Add'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

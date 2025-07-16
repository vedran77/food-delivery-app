import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/restaurant.dart';
import '../../core/models/cart.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String restaurantId;

  const RestaurantDetailScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  // Mock data - replace with actual API call
  late Restaurant restaurant;
  final Cart cart = const Cart();

  @override
  void initState() {
    super.initState();
    // Mock restaurant data with menu items
    restaurant = Restaurant(
      id: widget.restaurantId,
      name: 'Pizza Palace',
      image: 'assets/logo.png',
      description: 'Authentic Italian pizza made with fresh ingredients',
      rating: 4.5,
      reviewCount: 120,
      deliveryTime: '25-30 min',
      deliveryFee: 2.99,
      categories: ['Pizza', 'Italian'],
      isOpen: true,
      menu: [
        const MenuItem(
          id: '1',
          name: 'Margherita Pizza',
          description: 'Fresh tomatoes, mozzarella, basil',
          price: 12.99,
          image: 'assets/logo.png',
          category: 'Pizza',
          ingredients: ['Tomatoes', 'Mozzarella', 'Basil'],
        ),
        const MenuItem(
          id: '2',
          name: 'Pepperoni Pizza',
          description: 'Pepperoni, mozzarella, tomato sauce',
          price: 15.99,
          image: 'assets/logo.png',
          category: 'Pizza',
          ingredients: ['Pepperoni', 'Mozzarella', 'Tomato Sauce'],
        ),
        const MenuItem(
          id: '3',
          name: 'Caesar Salad',
          description: 'Romaine lettuce, parmesan, croutons',
          price: 8.99,
          image: 'assets/logo.png',
          category: 'Salad',
          ingredients: ['Romaine', 'Parmesan', 'Croutons'],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuCategories = restaurant.menu
        .map((item) => item.category)
        .toSet()
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                restaurant.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.restaurant, size: 50),
                  );
                },
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${restaurant.rating} (${restaurant.reviewCount} reviews)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.deliveryTime,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delivery_dining, color: Colors.green.shade700),
                        const SizedBox(width: 8),
                        Text(
                          'Free delivery on orders over \$25',
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final category = menuCategories[index];
                final categoryItems = restaurant.menu
                    .where((item) => item.category == category)
                    .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    ...categoryItems.map((item) => MenuItemCard(
                          menuItem: item,
                          onAddToCart: () => _addToCart(item),
                        )),
                  ],
                );
              },
              childCount: menuCategories.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: cart.items.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => context.push('/cart'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${cart.itemCount} items'),
                    Text('View Cart - \$${cart.total.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  void _addToCart(MenuItem item) {
    // In a real app, this would update the cart state management
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onAddToCart;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menuItem.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${menuItem.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    menuItem.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.fastfood),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
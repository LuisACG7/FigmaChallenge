import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/theme_constants.dart';
import 'bike_detail_screen.dart';
import 'bike_cart_screen.dart'; // IMPORTANTE: Importamos la nueva pantalla del carrito

class BikeHomeScreen extends StatelessWidget {
  const BikeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF242C4B), 
              Color(0xFF3893FF), 
            ],
            stops: [0.4, 0.8], 
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildHeader(),
                    const SizedBox(height: 25),
                    _buildPromoCard(),
                    const SizedBox(height: 25),
                    _buildCategoryFilters(),
                    const SizedBox(height: 25),
                    _buildAlignedProductGrid(),
                    const SizedBox(height: 120), 
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomNavigationBar(context), // Pasamos el context para permitir la navegación
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. Header de la App
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Choose Your Bike',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: ThemeConstants.textPrimary,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: ThemeConstants.neonBlueGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3893FF).withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: const Icon(Iconsax.search_normal_1, color: Colors.white, size: 22),
        ),
      ],
    );
  }

  // 2. Tarjeta de Promoción (30% Off)
  Widget _buildPromoCard() {
    return Container(
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: ThemeConstants.cardBackgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: 10,
            bottom: 10,
            left: 80,
            child: Image.asset(
              'assets/bike_promo.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Opacity(
                  opacity: 0.3,
                  child: Icon(Iconsax.radar, size: 140, color: Colors.white.withValues(alpha: 0.15)),
                );
              },
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                Text(
                  '30% Off',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: ThemeConstants.textPrimary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Filtros de Categorías Horizontales
  Widget _buildCategoryFilters() {
    final List<Map<String, dynamic>> categories = [
      {'label': 'All', 'icon': null, 'active': true},
      {'label': '', 'icon': Iconsax.battery_charging, 'active': false}, 
      {'label': '', 'icon': Iconsax.driving, 'active': false},          
      {'label': '', 'icon': Iconsax.cloud_lightning, 'active': false},  
      {'label': '', 'icon': Iconsax.watch, 'active': false},            
    ];

    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final bool isActive = cat['active'] as bool;

          return Container(
            margin: const EdgeInsets.only(right: 14),
            width: 55,
            decoration: BoxDecoration(
              gradient: isActive ? ThemeConstants.neonBlueGradient : null,
              color: isActive ? null : ThemeConstants.cardBackgroundColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isActive ? Colors.transparent : Colors.white.withValues(alpha: 0.08),
              ),
            ),
            alignment: Alignment.center,
            child: (cat['label'] as String).isNotEmpty
                ? Text(
                    cat['label'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  )
                : Icon(
                    cat['icon'] as IconData?,
                    color: isActive ? Colors.white : Colors.grey[400],
                    size: 22,
                  ),
          );
        },
      ),
    );
  }

  // 4. Grid de Productos Alineado
  Widget _buildAlignedProductGrid() {
    final List<Map<String, dynamic>> products = [
      {
        'category': 'Road Bike',
        'title': 'PEUGEOT - LR01',
        'price': '\$ 1,999.99',
        'imagePath': 'assets/bike_peugeot.png',
        'isLiked': false,
      },
      {
        'category': 'Road Helmet',
        'title': 'SMITH - Trade',
        'price': '\$ 120',
        'imagePath': 'assets/helmet.png',
        'isLiked': true,
      },
      {
        'category': 'Mountain Bike',
        'title': 'PILOT - Chromoly',
        'price': '\$ 1,999.99',
        'imagePath': 'assets/bike_pilot.png',
        'isLiked': false,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BikeDetailScreen(),
              ),
            );
          },
          child: _buildProductCard(
            category: product['category'] as String,
            title: product['title'] as String,
            price: product['price'] as String,
            imagePath: product['imagePath'] as String,
            isLiked: product['isLiked'] as bool,
          ),
        );
      },
    );
  }

  Widget _buildProductCard({
    required String category,
    required String title,
    required String price,
    required String imagePath,
    required bool isLiked,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeConstants.cardBackgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                isLiked ? Iconsax.heart5 : Iconsax.heart,
                color: isLiked ? Colors.redAccent : Colors.white.withValues(alpha: 0.6),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Iconsax.image, size: 40, color: Colors.white.withValues(alpha: 0.3)),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: const TextStyle(color: ThemeConstants.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: ThemeConstants.textPrimary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(color: ThemeConstants.textSecondary, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // 5. Barra de Navegación Inferior - MODIFICADA: Ahora escucha toques en el carrito para ir al detalle
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFF1B2339).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: ThemeConstants.neonBlueGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.directions_bike, color: Colors.white, size: 24),
            ),
            const Icon(Iconsax.map, color: Colors.grey, size: 24),
            
            // MODIFICADO: Envolvemos el icono con GestureDetector para enlazar la navegación al carrito
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BikeCartScreen(),
                  ),
                );
              },
              child: const Icon(Iconsax.shopping_cart, color: Colors.grey, size: 24),
            ),
            
            const Icon(Iconsax.user, color: Colors.grey, size: 24),
            const Icon(Iconsax.document_text_1, color: Colors.grey, size: 24),
          ],
        ),
      ),
    );
  }
}
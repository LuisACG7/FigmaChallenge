import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'theme_constants.dart';

class BikeCartScreen extends StatelessWidget {
  const BikeCartScreen({super.key});

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
              Color(0xFF333B5C),
            ],
            stops: [0.4, 0.8],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildTopHeader(context),
              
              // Lista scrollable de productos en el carrito
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: [
                    _buildCartItem(
                      title: 'PEUGEOT - LR01',
                      category: 'Road Bike',
                      price: '\$ 1,999.99',
                      imagePath: 'assets/bike_peugeot.png',
                      quantity: 1,
                    ),
                    _buildCartItem(
                      title: 'PILOT - CHROMOLY 520',
                      category: 'Road Bike',
                      price: '\$ 3999.99',
                      imagePath: 'assets/bike_pilot.png',
                      quantity: 1,
                    ),
                                     _buildCartItem(
                      title: 'SMITH - Trade',
                      category: 'Road Helmet',
                      price: '\$ 120.00',
                      imagePath: 'assets/helmet.png',
                      quantity: 1,
                    ),

                    const SizedBox(height: 20),
                    _buildDiscountSection(),
                  ],
                ),
              ),
              
              // Panel Inferior con Totales y Checkout
              _buildSummaryAndCheckoutPanel(),
            ],
          ),
        ),
      ),
    );
  }

  // Header superior con botón atrás y título centrado
  Widget _buildTopHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3893FF), Color(0xFF3893FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
          const Text(
            'My shopping Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 44), // Espaciador balanceador estético
        ],
      ),
    );
  }

  // Tarjeta individual de ítem de carrito
  Widget _buildCartItem({
    required String title,
    required String category,
    required String price,
    required String imagePath,
    required int quantity,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF222844).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          // Imagen contenedor izquierdo con fondo degradado suave
          Container(
            width: 85,
            height: 85,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF2B3354),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Iconsax.image, color: Colors.white30, size: 30),
            ),
          ),
          const SizedBox(width: 16),
          // Detalles textuales
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(color: ThemeConstants.textSecondary, fontSize: 12),
                ),
                const SizedBox(height: 12),
                Text(
                  price,
                  style: const TextStyle(color: Color(0xFF3893FF), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Controladores de cantidad (+ / -) a la derecha
          Column(
            children: [
              _buildQuantityButton(Icons.add, isIncrement: true),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              _buildQuantityButton(Icons.remove, isIncrement: false),
            ],
          )
        ],
      ),
    );
  }

  // Helper para los botones circulares de cantidad
  Widget _buildQuantityButton(IconData icon, {required bool isIncrement}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isIncrement ? ThemeConstants.neonBlueGradient : null,
        color: isIncrement ? null : const Color(0xFF2B3354),
        boxShadow: isIncrement ? [
          BoxShadow(
            color: const Color(0xFF3893FF).withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ] : null,
      ),
      child: Icon(icon, color: Colors.white, size: 14),
    );
  }

  // Input estilizado para Cupones / Descuentos
  Widget _buildDiscountSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1F243E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Your Promo Code',
                hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3), fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              gradient: ThemeConstants.neonBlueGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Panel inferior de Totales de Precio y Checkout
  Widget _buildSummaryAndCheckoutPanel() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFF1B223E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSummaryRow('Subtotal', '\$ 6,119.99'),
          const SizedBox(height: 12),
          _buildSummaryRow('Shipping', '\$ 0.00'),
          const SizedBox(height: 12),
          _buildSummaryRow('Discount', '30%'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: Colors.white10, height: 1),
          ),
          _buildSummaryRow('Total', '\$ 4,283.99', isTotal: true),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              gradient: ThemeConstants.neonBlueGradient,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3893FF).withValues(alpha: 0.35),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              'Checkout',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.grey[400],
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal ? const Color(0xFF3893FF) : Colors.white,
            fontSize: isTotal ? 20 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
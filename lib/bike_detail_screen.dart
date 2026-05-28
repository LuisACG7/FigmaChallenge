import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'theme_constants.dart';

class BikeDetailScreen extends StatelessWidget {
  const BikeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Mismo fondo con dos colores en diagonal idéntico a la Home
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF242C4B), // Lado izquierdo oscuro
              Color(0xFF3893FF), // Lado derecho claro
            ],
            stops: [0.4, 0.8],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              // Contenido principal scrolleable
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildTopBar(context),
                    _buildBikeImageSection(),
                    _buildProductDetailsSheet(),
                  ],
                ),
              ),
              // Botón "Add to Cart" fijo en la parte inferior
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomActionBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. Botones de Navegación de Arriba (Back y Heart)
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón Regresar con gradiente sutil de fondo
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF343E69), Color(0xFF242B4D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
          // Nombre o Identificador del producto en el Header (opcional, centrado)
          const Text(
            'PEUGEOT - LR01',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Botón de Favorito
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2B3354),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Iconsax.heart5, color: Colors.redAccent, size: 20),
          ),
        ],
      ),
    );
  }

  // 2. Sección central con la silueta de la Bicicleta
  Widget _buildBikeImageSection() {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Imagen principal de la bici
          Image.asset(
            'assets/bike_peugeot.png', // Asegúrate de tener esta imagen en tus assets
            fit: BoxFit.contain,
            width: 320,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Iconsax.radar, size: 180, color: Colors.white.withValues(alpha: 0.1));
            },
          ),
        ],
      ),
    );
  }

  // 3. Tarjeta Inferior de Detalles (Sube en curvas orgánicas hacia el frente)
  Widget _buildProductDetailsSheet() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 140),
      decoration: BoxDecoration(
        color: const Color(0xFF222844).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, -10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pestañas (Description / Specification)
          Row(
            children: [
              _buildTabButton('Description', isActive: true),
              const SizedBox(width: 20),
              _buildTabButton('Specification', isActive: false),
            ],
          ),
          const SizedBox(height: 25),
          // Título del Producto
          const Text(
            'PEUGEOT - LR01',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ThemeConstants.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          // Descripción con interlineado cómodo
          Text(
            'The LR01 uses the same geometry as the legendary Peugeot record-breaking bikes of the past. It offers an incredible blend of retro aesthetics and ultra-modern performance metrics for daily track or road usage.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.6),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // Helper para armar los botones de las pestañas
  Widget _buildTabButton(String text, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2A3154) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isActive 
          ? Border.all(color: Colors.white.withValues(alpha: 0.1)) 
          : null,
        boxShadow: isActive ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Colors.grey[500],
        ),
      ),
    );
  }

  // 4. Barra de Acción de abajo (Muestra Precio + Botón Add to Cart)
  Widget _buildBottomActionBar() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B223E).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Precio del producto
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Price',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(height: 4),
              Text(
                '\$ 1,999.99',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Botón Añadir al Carrito (Neon Blue Gradient)
          Container(
            width: 170,
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
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
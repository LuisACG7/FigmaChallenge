import 'package:flutter/material.dart';

class ThemeConstants {
  // Degradado del fondo principal de la app
  static const BoxDecoration mainBackgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF243B55), // Azul oscuro superior
        Color(0xFF141E30), // Fondo profundo
        Color(0xFF0F172A), // Esquina inferior oscura
      ],
    ),
  );

  // Degradado azul neón del fondo de la tarjeta derecha y botones activos
  static const LinearGradient neonBlueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF34CAE8),
      Color(0xFF4E49F2), 
    ],
  );

  // Color de las tarjetas oscuras (Glassmorphism simulado)
  static final Color cardBackgroundColor = const Color(0xFF232A3E).withOpacity(0.6);
  
  // Colores de texto
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;
}
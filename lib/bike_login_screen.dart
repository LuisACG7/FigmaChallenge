import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'theme_constants.dart';
import 'bike_home_screen.dart';

class BikeLoginScreen extends StatelessWidget {
  const BikeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Mismo fondo con dos colores en diagonal idéntico a toda la app
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Ícono decorativo superior con la temática de la app
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF222844).withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                      ),
                      child: ShaderMask(
                        shaderCallback: (bounds) => ThemeConstants.neonBlueGradient.createShader(bounds),
                        child: const Icon(
                          Icons.directions_bike,
                          size: 64,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  
                  // Títulos principales
                  const Text(
                    'BIKE ELECTRONICA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: ThemeConstants.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome back! Login to explore your ride.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Campo de Email
                  _buildInputField(
                    hintText: 'Email Address',
                    icon: Iconsax.sms,
                  ),
                  const SizedBox(height: 20),

                  // Campo de Contraseña
                  _buildInputField(
                    hintText: 'Password',
                    icon: Iconsax.lock,
                    isPassword: true,
                  ),
                  
                  // Olvidé mi contraseña
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Botón Ingresar (Manda al Home)
                  GestureDetector(
                    onTap: () {
                      // pushReplacement elimina el Login del historial para que no se pueda volver atrás con el botón físico
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BikeHomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56,
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
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Texto de registro inferior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 14),
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF3893FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Estructura para inputs integrados al estilo visual oscuro
  Widget _buildInputField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF222844).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey[400], size: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3), fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
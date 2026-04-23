import 'package:flutter/material.dart';
import 'bmi_categories_screen.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmi;
  final double weight;
  final double height;
  final bool isMale;

  const BMIResultScreen({
    super.key,
    required this.bmi,
    required this.weight,
    required this.height,
    required this.isMale,
  });

  String get _bmiCategory {
    if (bmi < 18.5) return 'Abaixo do peso';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Sobrepeso';
    return 'Obesidade';
  }

  Color get _categoryColor {
    if (bmi < 18.5) return const Color(0xFF42A5F5);
    if (bmi < 25.0) return const Color(0xFF66BB6A);
    if (bmi < 30.0) return const Color(0xFFFFA726);
    return const Color(0xFFEF5350);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Seu corpo',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BMICategoriesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Calculadora de IMC',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _GenderDisplay(
                  label: 'Masculino',
                  isSelected: isMale,
                  isMale: true,
                ),
                const SizedBox(width: 40),
                _GenderDisplay(
                  label: 'Feminino',
                  isSelected: !isMale,
                  isMale: false,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                          children: [
                            TextSpan(text: 'Seu peso '),
                            TextSpan(
                              text: '(kg)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        weight % 1 == 0
                            ? weight.toInt().toString()
                            : weight.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                          children: [
                            TextSpan(text: 'Sua altura '),
                            TextSpan(
                              text: '(cm)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        height % 1 == 0
                            ? height.toInt().toString()
                            : height.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Seu IMC',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _bmiCategory,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: _categoryColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Calcular IMC novamente',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4FC3F7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderDisplay extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isMale;

  const _GenderDisplay({
    required this.label,
    required this.isSelected,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? const Color(0xFFE3F2FD) : const Color(0xFFF5F5F5),
            border: isSelected
                ? Border.all(color: const Color(0xFF4FC3F7), width: 2.5)
                : null,
          ),
          child: Center(
            child: Text(
              isMale ? '👨' : '👩',
              style: const TextStyle(fontSize: 36),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.black87 : Colors.black38,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
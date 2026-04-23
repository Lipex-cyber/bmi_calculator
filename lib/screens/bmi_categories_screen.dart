import 'package:flutter/material.dart';

class BMICategoriesScreen extends StatelessWidget {
  const BMICategoriesScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Categorias de IMC',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            const _CategoryItem(
              range: 'Menos de 18,5',
              description: 'você está abaixo do peso.',
            ),
            const SizedBox(height: 32),
            const _CategoryItem(
              range: '18,5 a 24,9',
              description: 'você está no peso normal.',
            ),
            const SizedBox(height: 32),
            const _CategoryItem(
              range: '25 a 29,9',
              description: 'você está com sobrepeso.',
            ),
            const SizedBox(height: 32),
            const _CategoryItem(
              range: '30 ou mais',
              description: 'obesidade.',
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String range;
  final String description;

  const _CategoryItem({
    required this.range,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          range,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';
import 'bmi_categories_screen.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  bool _isMaleSelected = true;
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _validateAndCalculate() {
    setState(() {
      _errorMessage = null;
    });

    final weightText = _weightController.text.trim();
    final heightText = _heightController.text.trim();

    if (weightText.isEmpty || heightText.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, preencha o peso e a altura.';
      });
      return;
    }

    final weight = double.tryParse(weightText.replaceAll(',', '.'));
    final height = double.tryParse(heightText.replaceAll(',', '.'));

    if (weight == null || height == null) {
      setState(() {
        _errorMessage = 'Por favor, insira valores numéricos válidos.';
      });
      return;
    }

    if (weight <= 0) {
      setState(() {
        _errorMessage = 'O peso deve ser maior que zero.';
      });
      return;
    }

    if (height <= 0) {
      setState(() {
        _errorMessage = 'A altura deve ser maior que zero.';
      });
      return;
    }

    if (weight > 500) {
      setState(() {
        _errorMessage = 'Por favor, insira um peso válido (máx. 500 kg).';
      });
      return;
    }

    if (height > 300) {
      setState(() {
        _errorMessage = 'Por favor, insira uma altura válida (máx. 300 cm).';
      });
      return;
    }

    final heightInMeters = height / 100;
    final bmi = weight / (heightInMeters * heightInMeters);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BMIResultScreen(
          bmi: bmi,
          weight: weight,
          height: height,
          isMale: _isMaleSelected,
        ),
      ),
    );
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
          onPressed: () {},
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
      body: SingleChildScrollView(
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
                _GenderOption(
                  label: 'Masculino',
                  isSelected: _isMaleSelected,
                  isMale: true,
                  onTap: () => setState(() => _isMaleSelected = true),
                ),
                const SizedBox(width: 40),
                _GenderOption(
                  label: 'Feminino',
                  isSelected: !_isMaleSelected,
                  isMale: false,
                  onTap: () => setState(() => _isMaleSelected = false),
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
                      TextField(
                        controller: _weightController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (_) => setState(() => _errorMessage = null),
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
                      TextField(
                        controller: _heightController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (_) => setState(() => _errorMessage = null),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red.shade400, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red.shade700, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _validateAndCalculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FC3F7),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Calcular seu IMC',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isMale;
  final VoidCallback onTap;

  const _GenderOption({
    required this.label,
    required this.isSelected,
    required this.isMale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
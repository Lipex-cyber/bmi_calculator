# 📱 BMI Calculator — Flutter

Aplicação Flutter que calcula o **Índice de Massa Corporal (IMC)** utilizando **Stateful Widgets** para gerenciamento de estado dinâmico.

---

## 📸 Telas

| Calculadora | Resultado | Categorias |
|-------------|-----------|------------|
| Entrada de peso e altura com seleção de gênero | Exibe o IMC calculado com categoria | Lista todas as faixas de IMC |

---

## 🚀 Funcionalidades

- ✅ Seleção de gênero (Masculino / Feminino)
- ✅ Entrada de peso (kg) e altura (cm)
- ✅ Cálculo de IMC com fórmula: `IMC = peso / (altura_em_metros²)`
- ✅ Classificação automática (Abaixo do peso, Normal, Sobrepeso, Obesidade)
- ✅ Tela de categorias de IMC
- ✅ Prevenção de erros (campos vazios, valores inválidos, divisão por zero)
- ✅ Mensagens de erro amigáveis ao usuário

---

## 🧮 Fórmula do IMC

```
IMC = peso (kg) / (altura (m) × altura (m))
```

**Categorias:**
| IMC | Classificação |
|-----|---------------|
| Menos de 18,5 | Abaixo do peso |
| 18,5 a 24,9 | Normal |
| 25 a 29,9 | Sobrepeso |
| 30 ou mais | Obesidade |

---

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart                          # Ponto de entrada da aplicação
└── screens/
    ├── bmi_calculator_screen.dart     # Tela principal (StatefulWidget)
    ├── bmi_result_screen.dart         # Tela de resultado do IMC
    └── bmi_categories_screen.dart     # Tela de categorias de IMC
```

---

## 🛠️ Tecnologias

- **Flutter** 3.x
- **Dart** 3.x
- **Material Design 3**
- **StatefulWidget** para gerenciamento de estado

---

## ▶️ Como Executar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/bmi_calculator.git
   cd bmi_calculator
   ```

2. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

3. **Execute a aplicação:**
   ```bash
   flutter run
   ```

---

## 🔒 Prevenção de Erros

A aplicação trata os seguintes casos:
- Campos de peso/altura vazios
- Valores não numéricos
- Peso ou altura iguais a zero (evita divisão por zero)
- Valores negativos
- Valores fora do intervalo razoável (peso > 500 kg, altura > 300 cm)

---

## 📚 Conceitos Flutter Utilizados

- **StatefulWidget** e **setState()** para atualização dinâmica da UI
- **TextEditingController** para captura e controle dos campos de texto
- **Navigator** para navegação entre telas
- **MaterialApp** e **ThemeData** para configuração global de tema
- **Scaffold**, **AppBar**, **Column**, **Row** para estrutura de layout

---

## 👨‍💻 Autor

Desenvolvido como atividade acadêtica de Flutter — Cálculo de IMC com Stateful Widget.

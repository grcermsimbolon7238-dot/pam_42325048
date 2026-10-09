import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Controller memegang resource (listener) di memori. Jika tidak dibuang
    // saat widget dihancurkan, akan terjadi memory leak.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLength: 20, // Batas maksimal karakter input
          decoration: const InputDecoration(
            labelText: 'Name',
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey, // Warna underline blueGrey
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                // Warna garis bawah saat TextField sedang difokuskan (diketik)
                color: Colors.blueGrey,
              ),
            ),
          ),
          onChanged: (text) {
            // Dipanggil setiap isi teks berubah; dicetak ke Debug Console
            debugPrint('Text changed: $text');
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;

  get reiniciar => null;
  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    {
      contador--;
      setState(() {});
    }
    void reiniciar() {
      contador = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloTexto = TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          elevation: 10,
        ),
        backgroundColor: const Color.fromARGB(255, 208, 173, 224),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Número de taps:',
              style: estiloTexto,
            ),
            Text(
              '$contador',
              style: estiloTexto,
            ),
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActionButton(
          decrease: decrementar,
          increase: incrementar,
          reset: reiniciar,
        ));
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function increase;
  final Function decrease;
  final Function reset;

  @override
  const CustomFloatingActionButton(
      {super.key,
      required this.increase,
      required this.decrease,
      required this.reset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 8, 177, 112),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () => decrease,
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 8, 177, 64),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () => reset,
          child: const Icon(Icons.restart_alt),
        ),
        FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 21, 152, 45),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () => increase,
          child: const Icon(Icons.exposure_plus_1),
        ),
      ],
    );
  }
}

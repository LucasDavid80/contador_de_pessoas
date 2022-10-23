import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _contador = 0;
  String txtPrincipal = 'Pode Entrar!';

  void _decrementar() {
    setState(() {
      /*if (_contador > 0) {*/
      _contador--;
      /*}

      if (_contador < 30) {
        txtPrincipal = 'Pode Entrar!';
      }*/
    });
  }

  void _incrementar() {
    setState(() {
      /*if (_contador < 30) {
        txtPrincipal = 'Pode Entrar!';*/
      _contador++;
      /*}

      if (_contador == 30) {
        txtPrincipal = 'Está cheio!';
      }*/
    });
  }

  bool get isEmpty => _contador == 0;
  bool get isFull => _contador == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                '$_contador',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : _incrementar,
                  style: ButtonStyle(
                    backgroundColor: isFull
                        ? MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.2))
                        : MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(100, 100)),
                    overlayColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(30, 0, 0, 0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Entrou!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isEmpty ? null : _decrementar,
                  style: ButtonStyle(
                    backgroundColor: isEmpty
                        ? MaterialStateProperty.all(
                            Colors.white.withOpacity(0.2))
                        : MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(100, 100)),
                    overlayColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(30, 0, 0, 0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Saiu!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

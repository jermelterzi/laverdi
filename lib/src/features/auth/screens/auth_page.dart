import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/laverdi_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 264,
            child: Column(
              children: const [
                Text(
                  'LAVERDI',
                  style: TextStyle(
                    fontSize: 56,
                    color: Color(0xFF008037),
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'SEU CARDÁPIO SEMANAL E LISTA DE COMPRAS NUM LUGAR SÓ!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF008037),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Material(
            child: Column(
              children: [
                TextFormField(),
                const SizedBox(height: 8),
                TextFormField(),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x887ED957),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: const Size(264, 72),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x88008037),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: const Size(264, 72),
                ),
                child: const Text(
                  'CADASTRE-SE',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

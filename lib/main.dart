import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICE SHOP',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Calculator App Change'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var receiveMoney = TextEditingController();
  double total = 0.0;
  double change = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Change Calculator",
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Snowy',
                color: const Color.fromARGB(255, 121, 65, 206),
                backgroundColor: const Color.fromARGB(255, 230, 218, 255),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Image.asset(
              'assets/2022-Formula1-Audi-Show-Car-005-1440w.png',
              height: 200,
            ),
            Image.network(
              'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZHg3eGM4OGxjcThpczVmZHlsbW5yMWU1Y3VxbXF1OTJybW9nOTdrayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/K06nw2VT3jq6Pm0BxO/giphy.gif',
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: priceTextField(),
            ),
            const SizedBox(height: 16),
            Padding(padding: const EdgeInsets.all(8.0), child: amountOfItems()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: calculateButton(),
            ),
            const SizedBox(height: 16),
            Padding(padding: const EdgeInsets.all(8.0), child: totalDisplay()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: receiveMoneyTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: changeCalculationButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: showChangeDisplay(),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceTextField() {
    return TextField(
      controller: price,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Price per item',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget amountOfItems() {
    return TextField(
      controller: amount,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Amount of items',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget calculateButton() {
    return ElevatedButton(
      onPressed: () {
        if (price.text.isNotEmpty && amount.text.isNotEmpty) {
          double pricePerItem = double.parse(price.text);
          int itemCount = int.parse(amount.text);
          setState(() {
            total = pricePerItem * itemCount;
          });
        }
      },
      child: Text('Calculate Total'),
    );
  }

  Widget totalDisplay() {
    return Text(
      'Total: \$${total.toStringAsFixed(2)}',
      style: TextStyle(fontSize: 24),
    );
  }

  Widget receiveMoneyTextField() {
    return TextField(
      controller: receiveMoney,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Receive Money',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget changeCalculationButton() {
    return ElevatedButton(
      onPressed: () {
        if (receiveMoney.text.isEmpty || total <= 0) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('money is not be empty')));
          return;
        }

        double received = double.parse(receiveMoney.text);

        if (received < total) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('money is not enough')));
          return;
        }

        setState(() {
          change = received - total;
        });
      },
      child: Text('Calculate Change'),
    );
  }

  Widget showChangeDisplay() {
    return Text(
      'Change: \$${change.toStringAsFixed(2)}',
      style: TextStyle(fontSize: 24),
    );
  }
}

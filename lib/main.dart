import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Облека',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ClothingListScreen(),
    );
  }
}

class ClothingListScreen extends StatelessWidget {
  const ClothingListScreen({super.key});

  final List<Map<String, dynamic>> clothingItems = const [
    {
      'name': 'Маица',
      'image': 'https://i.ebayimg.com/images/g/~d8AAOSw4gVkxaDa/s-l1200.jpg',
      'description': 'Квалитетна памучна маица.',
      'price': 1200,
      'material': '100% Памук',
    },
    {
      'name': 'Патики',
      'image': 'https://i.ebayimg.com/images/g/SBUAAOSw~hFkGWcZ/s-l1200.jpg',
      'description':
      'Удобни и модерни патики. Air Jordan 1 Retro High ја преправа класичната патика, давајќи ви свеж изглед со познато чувство. Премиум материјалите со нови бои и текстури му даваат модерен израз на омилениот на сите времиња.',
      'price': 7500,
    },
    {
      'name': 'Јакна',
      'image': 'https://i.ebayimg.com/images/g/KgcAAOSwV91kdXN-/s-l1600.webp',
      'description': 'Модерна јакна со висок квалитет. WITH EMBROIDERED AND DISTRESSING DETAILS',
      'price': 5000,
    },
    {
      'name': 'Дуксерка',
      'image': 'https://i.ebayimg.com/images/g/-5cAAOSwxzVhQ4Qm/s-l1600.webp',
      'description': 'Модерна и квалитетна дуксерка. 100% COTTON FLEECE ZIP HOODIE',
      'price': 3500,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('213029'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClothingDetailScreen(item: item),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green, // Позадина на картичката
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.network(
                        item['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const ClothingDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                item['image'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item['description'],
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Цена: ${item['price']} ден.',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

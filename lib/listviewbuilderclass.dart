import 'package:flutter/material.dart';

class Listviewbuilderclass extends StatelessWidget {
  const Listviewbuilderclass({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/man1.png",
        "title": "Product 1",
        "price": "Rs 1500",
      },
      {
        "image": "assets/man2.png",
        "title": "Product 2",
        "price": "Rs 2500",
      },
      {
        "image": "assets/splash_screen.png",
        "title": "Product 3",
        "price": "Rs 3500",
      },
      {
        "image": "assets/man1.png",
        "title": "Product 4",
        "price": "Rs 4500",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Grid Example")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // ek row me 2 containers
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // height aur width ka ratio
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  items[index]["image"],
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  items[index]["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  items[index]["price"],
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

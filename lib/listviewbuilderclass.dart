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
          crossAxisCount: 2, // 1 row me 2 containers
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // height/width ratio
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image top full width
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    items[index]["image"],
                    height: 120,
                    width: double.infinity, // container ki width k mutabiq
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        items[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 5),

                      // Price
                      Text(
                        items[index]["price"],
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

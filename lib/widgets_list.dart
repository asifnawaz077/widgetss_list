import 'package:flutter/material.dart';

class WidgetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.brown),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Welcome to the App!', style: TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'title': 'Image', 'property1': 'height (double):\n Used to set height of the image.',
      'property2': 'width (doube):\n Used to Set width of the image.',
      'property3': 'fit (BoxFit):\n How to inscribe the image into the space allocated during layout.'
    }, //Title
    {'title': 'Text', 'property1': 'Max Line (int): \n An optional maximum number of lines for the text to span, wrapping if necessary. If the text exceeds the given number of lines, it will be truncated according to overflow.',
      'property2': 'textAlign (textAlign):\n How the text should be aligned horizontally.',
      'property3': 'Style (TextStyle):\n If non-null, the style to use for this text.'}, //Text
    {'title': 'App Bar', 'property1': 'leading: \n It takes in a widget and can be assigned anything — text, an icon, or even multiple widgets within a row.',
      'property2': 'Title (Text): \n As the name suggests, it’s mostly used for showing titles, such as the app title or a page header.',
      'property3': 'backgroundColor: (Colors)\n Changes the background color of AppBar to specified color.'}, //Appbar
    {'title': 'Container', 'property1': 'Child:\n This property is used to store the child widget of the container.',
      'property2': 'margin:\n This property is used to surround the empty space around the container. We can observe this by seeing white space around the container. Suppose we have used the "EdgeInsets.all(25)" that set the equal margin in all four directions',
      'property3': 'alignment: (Alignment):\n This property is used to set the position of the child within the container. Flutter allows the user to align its element in various ways such as center, bottom, bottom center, topLeft, centerRight, left, right, and many more.'},
    {'title': 'Column', 'property1': 'Children:\n A list of widgets to be displayed in the column, arranged in the order they appear in the list.',
      'property2': 'mainAxisAlignment:\n Defines how the children should be placed along the main axis (vertically, in the case of a Column). Possible values include: start, end, center, spaceBetween, spaceAround, spaceEvenly.',
      'property3': 'verticalDirection:\n Defines the order in which the children are placed along the main axis. Possible values include VerticalDirection.down (top to bottom) and VerticalDirection.up (bottom to top).'},
    {'title': 'Stack', 'property1': 'alignment (AlignmentGeometry)\n To align widgets in a Stack, we can use the alignment property of the Stack widget. This property takes an Alignment object that specifies the horizontal and vertical alignment of non-positioned child widgets.',
      'property2': 'clipBehavior (Clip):\n Overflow in a Stack can be handled in a few different ways. One way is to use the clipBehavior property of the Stack widget to clip the child widgets to the boundaries of the Stack widget.',
      'property3': 'fit (StackFit):\n How to size the non-positioned children in the stack.'},
    {'title': 'Icon', 'property1': 'icon (Icons):\n It is used to specify the icon name to display in the application. Generally, Flutter uses material design icons that are symbols for common actions and items.',
      'property2': 'size (double):\n It is used to resize the Icon according to design.',
      'property3': 'color (Colors):\n It is used to set the color of the icon.'},
    {'title': 'Snackbar', 'property1': 'duration\n It is used to specify how much time the snack bar should be displayed. ',
      'property2': 'shape: \n It is used to customize the shape of a snack bar.',
      'property3': 'action \n It is used to take action when the user taps on the snack bar. It cannot be dismissed or cancel. We can only undo or redo in the snack bar.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.withOpacity(0.5),
        title: Text('Widget List'),
        centerTitle: true,
        titleSpacing: 5,
        //backgroundColor: Colors.deepOrangeAccent,

      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: items[index]),
                ),
              );
            },
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            hoverColor: Colors.white,
            leading: Icon(Icons.token_outlined),
            textColor: Colors.black87,
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.withOpacity(0.5),
        title: Text(item['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(item['property1']!, style: TextStyle(fontSize: 16))),
            SizedBox(height: 10),
            Expanded(child: Text(item['property2']!, style: TextStyle(fontSize: 16))),
            SizedBox(height: 10),
            Expanded(child: Text(item['property3']!, style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
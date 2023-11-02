import 'package:flutter/material.dart';
class MainHomePage extends StatefulWidget {
  const MainHomePage({ Key? key }) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final numbers = List.generate(6, (index) => '$index');
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGridView(),
    );
  }

   Widget buildGridView() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        controller: controller,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final item = numbers[index];

          return buildNumber(item);
        },
      );

  Widget buildNumber(String number) => Container(
        padding: EdgeInsets.all(16),
        color: Colors.orange,
        child: GridTile(
          child: Center(
            child: Image.asset('assets/images/Pos.jpeg')
          ),
          footer: Text(
            'Footer $number',
            textAlign: TextAlign.center,
          ),
        ),
      );
}
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:Scaffold(
        appBar: NewAppBar(),
        body: NewBody(),
        bottomNavigationBar: NewNavBar(icons: [
          Icon(Icons.abc),
          Icon(Icons.add),
          Icon(Icons.circle),
          Icon(Icons.point_of_sale_outlined),
        ]),
        )
    );
  }
} 

class NewNavBar extends StatelessWidget {
  final List<Icon>icons;
  const NewNavBar({super.key,required this.icons});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }  

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: icons.map((e) => BottomNavigationBarItem(label: "", icon:e)).toList() );
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const NewAppBar({super.key});

  @override 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override 
  Widget build(BuildContext context){
    return AppBar(title: const Text("Dicas"));
  }
}

class NewBody extends StatelessWidget{
  const NewBody({super.key});

  @override 
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: const [
            Expanded(
              child: Text("La Fin Du Monde - Bock - 65 ibu"),
            ),
            Expanded(
              child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
            ),
            Expanded(
              child: Text("Duvel - Pilsner - 82 ibu"),
            )
          ]),
    );
  }

}

void main() => runApp(const MyApp());

/* void main() {
  var myApp = MyApp();
  runApp(const MyApp());
}
*/
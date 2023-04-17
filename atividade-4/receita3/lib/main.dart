import 'package:flutter/material.dart';


void main() {

  MyApp app = const MyApp();

  runApp(app);

}


class NewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const NewAppBar({super.key});

  @override 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override 
  Widget build(BuildContext context){
    return AppBar(
      title: const Text("Dicas"),
      actions: const [
        DropdownMenu(
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 1, label: "azul"),
            DropdownMenuEntry(value: 2, label: "verde"),
            DropdownMenuEntry(value: 3, label: "marrom"),
          ]
          )
      ],
      );
  }
}






class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: Scaffold(

        appBar:const NewAppBar(),

        body: DataBodyWidget(objects:const [

          "La Fin Du Monde - Bock - 65 ibu",

          "Sapporo Premiume - Sour Ale - 54 ibu",

          "Duvel - Pilsner - 82 ibu"

        ]),

        bottomNavigationBar:const NewNavBar(objects:
          [
          Icon(Icons.abc),
          Icon(Icons.add),
          Icon(Icons.circle),
          Icon(Icons.point_of_sale_outlined),]
        ),

      ));

  }

}





class NewNavBar extends StatelessWidget {

  final List<Icon> objects;
  const NewNavBar({super.key,this.objects = const []});



  void botaoFoiTocado(int index) {

    print("Tocaram no botão $index");

  }



  @override

  Widget build(BuildContext context) {

    return BottomNavigationBar(onTap: botaoFoiTocado, items: objects.map((icon) => BottomNavigationBarItem(icon: icon,label: "")).toList());

  }

}



class DataBodyWidget extends StatelessWidget {

  List<String> objects;

  DataBodyWidget( {this.objects = const [] });



  Expanded processarUmElemento(String obj){

    return Expanded(                

          child: Center(child: Text(obj)),

        );

  }



  @override

  Widget build(BuildContext context) {

    return Column(children: objects.map( 

      (obj) => Expanded(

        child: Center(child: Text(obj)),

        )

      ).toList());

  }

}
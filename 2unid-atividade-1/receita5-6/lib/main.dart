import "package:flutter_hooks/flutter_hooks.dart";
import 'package:flutter/material.dart';

class DataService{

  final ValueNotifier<List> tableStateNotifier =  ValueNotifier([[''],[''],[]]);

  void carregar(index){

    if (index == 1) carregarCervejas();
    if (index == 0) carregarCafe();
    if (index == 2) carregarNacoes();

  }


  void carregarCervejas(){
    
    tableStateNotifier.value = [
            ["name","style","ibu"],
            ["NOME","ESTILO","IBU"],
            [{
            "name": "La Fin Du Monde",

            "style": "Bock",

            "ibu": "65"

            },

            {

            "name": "Sapporo Premiume",

            "style": "Sour Ale",

            "ibu": "54"

            },

            {

            "name": "Duvel", 

            "style": "Pilsner", 

            "ibu": "82"

            }

          ]];

    }

    void carregarCafe(){
    
    tableStateNotifier.value = [
            ["blend name","origin","intesifier"],
            ["NOME DA MISTURA","ORIGEM","INTESIFICADOR"],
            [{
            "blend name": "Winter Town",

            "origin": "Mount Elgon, Uganda",

            "intesifier": "dry"

            },

            {

            "blend name": "Joe Enlightenment",

            "origin": "Bugisu, Uganda",

            "intesifier": "dirty"

            },

            {

            "blend name": "Chocolate Select", 

            "origin": "Gayo, Sumatra", 

            "intesifier": "complex"

            }

          ]];
    }

    void carregarNacoes(){
    
    tableStateNotifier.value = [
            ["nationality","language","flag"],
            ["NACIONALIDADE","LiNGUAGEM","BANDEIRA"],
            [{
            "nationality": "Ghanaians",

            "language": "Marathi",

            "flag": "🇱🇮"

            },

            {

            "nationality": "Yemenis",

            "language": "Marathi",

            "flag": "🇯🇲"

            },

            {

            "nationality": "Aromanians", 

            "language": "Arabic", 

            "flag": "🇻🇳"

            }

          ]];

    }


}

final dataService = DataService();



void main() {

  MyApp app = const MyApp();

  runApp(app);

}



class MyApp extends StatelessWidget {

   const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    print("no build da classe MyApp");
    

    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner:false,

      home: Scaffold(

        appBar: AppBar( 

          title: const Text("Dicas"),

          ),

        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder: (context,value,widget) {
            return DataTableWidget(
              propertyNames: value[0],
              columnNames: value[1],
              jsonObjects: value[2],
            );
          }
          ),

        bottomNavigationBar:NewNavBar(itemSelectedCallback: dataService.carregar,),

      ));

  }

}



class NewNavBar extends HookWidget {
  var  itemSelectedCallback;
  NewNavBar({super.key,this.itemSelectedCallback}){
    itemSelectedCallback ??= (_){} ;
  }



  void buttonTapped(int index) {

    print("Tocaram no botão $index");

  }



  @override

  Widget build(BuildContext context) {
    print("no build da classe NewNavbar");
    var state = useState(1);
    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        itemSelectedCallback(index);
        }, 
      currentIndex: state.value,
      items: const [

      BottomNavigationBarItem(

        label: "Cafés",

        icon: Icon(Icons.coffee_outlined),

      ),

      BottomNavigationBarItem(

          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),

      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))

    ]);

  }

}



class DataTableWidget extends StatelessWidget {


  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;


  DataTableWidget( {this.jsonObjects = const [], this.columnNames = const ["Nome","Estilo","IBU"], this.propertyNames= const ["name", "style", "ibu"]});


  @override

  Widget build(BuildContext context) {
    print("no build da classe DataTableWidget");
    return DataTable(

      columns: columnNames.map( 

                (name) => DataColumn(

                  label: Expanded(

                    child: Text(name, style: const TextStyle(fontStyle: FontStyle.italic))

                  )

                )

              ).toList()       

      ,

      rows: jsonObjects.map( 

        (obj) => DataRow(

            cells: propertyNames.map(

              (propName) => DataCell(Text(obj[propName]))

            ).toList()

          )

        ).toList());

  }
}


class NewNavBar2 extends StatefulWidget{
  const NewNavBar2({super.key});
  @override
  State<NewNavBar2> createState() => _NewNavBar2State();
}

class _NewNavBar2State extends State<NewNavBar2> {
  void buttonTapped(int index) {

    print("Tocaram no botão $index");

  }
  var state = 1;
  @override

  Widget build(BuildContext context) {
    print("no build da classe NewNavbar");
    return BottomNavigationBar(
      onTap: (index) {setState( () =>  state = index);}, 
      currentIndex: state,
      items: const [

      BottomNavigationBarItem(

        label: "Cafés",

        icon: Icon(Icons.coffee_outlined),

      ),

      BottomNavigationBarItem(

          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),

      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))

    ]);

  }
}
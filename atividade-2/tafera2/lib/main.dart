import "package:flutter/material.dart";

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context){
    var rows =  [ const DataRow(
                cells:[
                  DataCell(Text("La Fin Du Monde")),
                  DataCell(Text("Bock")),
                  DataCell(Text("65")),
                ]
              ),
              const DataRow(
                cells:[
                  DataCell(Text("Sapporo Premium")),
                  DataCell(Text("Sour Ale")),
                  DataCell(Text("54")),
                ]
              ),
              const DataRow(
                cells:[
                  DataCell(Text("Duvel")),
                  DataCell(Text("Pilsner")),
                  DataCell(Text("82")),
                ]
              ),
            ];
    rows.addAll(buildRows(13));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text("TABELA"),),
        body: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(label: Text("Nome")),
              DataColumn(label: Text("estilo")),
              DataColumn(label: Text("IBU")),
            ],
            rows: rows
            ),
        ),
      ),
    );
  }

  List<DataRow> buildRows(int n){
    List<DataRow> ns = [];
    for(int x = 0;x<n;x++){
      ns.add(
          DataRow(
                cells:[
                  DataCell(Text("Mario $x"),placeholder: true),
                  DataCell(Text("Dev $x"),placeholder: true),
                  DataCell(Text("n ${x+82}"),placeholder: true),
                ]
              ),
      );
    }
    return ns;
  }

}
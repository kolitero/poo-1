import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown,appBarTheme: const AppBarTheme(elevation: 20,centerTitle: true)),
      home: Scaffold(
        appBar: AppBar(title: const Text("Meu app")),
        body: Center(
            child: Column(
              children: [
                const Text("LINK...", style: TextStyle(fontStyle: FontStyle.italic)),
                const Text("PARK.."),
                const Text("KKKK."),
                FadeInImage.assetNetwork(
                  image: "https://static.wikia.nocookie.net/zelda/images/1/1c/TotK_-_Link_imagen_oficial.png/revision/latest?cb=20230220223232&path-prefix=es",
                  placeholder: "assets/Loading_icon.gif",
                      
              ),
            ]
          )
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.stop),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.circle),label: ""),
        ],
        onTap: (int nosense) {},
        ),
      ));

  runApp(app);
}

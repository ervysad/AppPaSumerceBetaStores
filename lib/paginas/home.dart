import 'package:flutter/material.dart';
import 'package:hello_world_vs/Gauth.dart';
import 'package:hello_world_vs/paginas/ListaItems.dart';

class HOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido,  ${name}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Datasearch());
            },
          )
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                //Cointainer General (wrapper)
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.green[100], Colors.lightBlue[400]],
                )),
                child: Stack(children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                          //Content1
                          ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          imageUrl,
                        ),
                      ),
                      SizedBox(
                        height: 1000.0,
                      ),
                    ],
                  ))
                ]),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //Cointainer General (wrapper)
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                      ),

                      child: Stack(children: <Widget>[
                        Container(
                            child: Column(
                          children: <Widget>[
                            Container(
                                //Content1
                                ),
                            SizedBox(
                              height: 20.0,
                            ),
                            CircleAvatar(
                              radius: 45.0,
                              backgroundImage: NetworkImage(
                                imageUrl,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Datasearch extends SearchDelegate<ListaItems> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Performing Actions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //  Main Icon on left
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(
      query,
      style: TextStyle(fontSize: 20),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? CargarItems()
        : CargarItems().where((p) => p.title.contains(query)).toList();
    return myList.isEmpty
        ? Text(
            'No hay coincidencias',
            style: TextStyle(fontSize: 20),
          )
        : ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              final ListaItems listItem = myList[index];
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title: RichText(
                  text: TextSpan(
                      text: listItem.title.substring(0, query.length),
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: listItem.title.substring(query.length),
                            style: TextStyle(color: Colors.grey))
                      ]),
                ),
              );
            },
          );
  }
}

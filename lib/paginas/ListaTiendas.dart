import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hello_world_vs/paginas/TiendaPantalla.dart';
import 'package:hello_world_vs/paginas/TiendaInfo.dart';
import 'package:hello_world_vs/logic/dat_store.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_vs/Gauth.dart';
import 'package:hello_world_vs/paginas/ListaItems.dart';
import 'package:flutter/material.dart';

class ListViewProduct extends StatefulWidget {
  @override
  _ListViewProductState createState() => _ListViewProductState();
}

final storeReference = FirebaseDatabase.instance.reference().child('stores');

class _ListViewProductState extends State<ListViewProduct> {
  List<Stores> items;
  StreamSubscription<Event> _onStoreAddedStore;
  StreamSubscription<Event> _onStoreEditStore;
  StreamSubscription<Event> _onStoreDeleteStore;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onStoreAddedStore = storeReference.onChildAdded.listen(_onStoreAdded);
    _onStoreEditStore = storeReference.onChildChanged.listen(_onStoreEdit);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onStoreAddedStore.cancel();
    _onStoreEditStore.cancel();
    _onStoreDeleteStore.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido,  ${name}'),
          centerTitle: true,
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
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position) {
                return Column(children: <Widget>[
                  Divider(
                    height: 7.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: ListTile(
                        title: Text(
                          '${items[position].name}',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 21.0,
                          ),
                        ),
                        subtitle: Text(
                          '${items[position].description}',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21.0,
                          ),
                        ),
                        leading: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 17.0,
                              child: Text(
                                '${position + 1}',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 21.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        onTap: () =>
                            _navigateToStoreDetails(context, items[position]),
                      )),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () =>
                              _deleteStore(context, items[position], position)),
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.yellow,
                          ),
                          onPressed: () =>
                              _navigateToStore(context, items[position])),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ]);
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepOrange,
          onPressed: () => _createNewStore(context),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewProduct()));
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewProduct()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onStoreAdded(Event event) {
    setState(() {
      items.add(new Stores.fromSnapshot(event.snapshot));
    });
  }

  void _onStoreEdit(Event event) {
    var oldStoreValue =
        items.singleWhere((Stores) => Stores.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldStoreValue)] =
          new Stores.fromSnapshot(event.snapshot);
    });
  }

  void _deleteStore(BuildContext context, Stores stores, int position) async {
    await storeReference.child(stores.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToStoreDetails(BuildContext context, Stores stores) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoresScreen(stores)),
    );
  }

  void _navigateToStore(BuildContext context, Stores stores) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoresInformation(stores)),
    );
  }

  void _createNewStore(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StoresScreen(Stores(null, '', '', '', ''))),
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

class ListaItems {
  final String title;
  final String category;
  final int longitud;
  ListaItems({
    this.title,
    this.category,
    this.longitud,
  });
}

List<ListaItems> CargarItems() {
  var fi = <ListaItems>[
    ListaItems(
      title: "QUESO PAIPA",
      category: "Quesos",
    ),
    ListaItems(
      title: "QUESO AZUL",
      category: "Quesos",
    ),
    ListaItems(
      title: "ALMOJABANAS",
      category: "Amacijos",
    ),
    ListaItems(
      title: "PAN DE YUCA",
      category: "Amacijos",
    ),
    ListaItems(
      title: "GALLETAS",
      category: "Supermercado",
    ),
    ListaItems(
      title: "CHOCOLATE",
      category: "Supermercado",
    ),
    ListaItems(
      title: "DULCES",
      category: "Supermercado",
    ),
  ];
  return fi;
}

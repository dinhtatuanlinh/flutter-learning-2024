import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/data/categories.dart';
import 'package:my_app/widgets/new_item.dart';
import 'package:my_app/models/grocery_item.dart';

import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        "flutter-project-676b2-default-rtdb.asia-southeast1.firebasedatabase.app",
        "shopping-list.json");

    final res = await http.get(url);
    if (res.statusCode >= 400) {
      throw Exception(
          "Failed to fetch grocery items. Please try agrain later.");
    }
    if (res.body == "null") {
      return [];
    }
    final Map<String, dynamic> listData = json.decode(res.body);
    final List<GroceryItem> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (element) => element.value.title == item.value["category"])
          .value;

      _loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value["name"],
          quantity: item.value["quantity"],
          category: category));
    }

    return _loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        "flutter-project-676b2-default-rtdb.asia-southeast1.firebasedatabase.app",
        "shopping-list/${item.id}.json");
    final res = await http.delete(url);
    print(res.body);
    print(res.statusCode);
    if (res.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  Widget _futureBuilder(AsyncSnapshot<List<GroceryItem>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    }

    if (snapshot.data!.isEmpty) {
      return const Center(
        child: Text("No items added yet."),
      );
    }

    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (ctx, index) =>
          Dismissible(
            onDismissed: (direction) {
              _removeItem(snapshot.data![index]);
            },
            key: ValueKey(snapshot.data![index].id),
            child: ListTile(
              title: Text(snapshot.data![index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: snapshot.data![index].category.color,
              ),
              trailing: Text(snapshot.data![index].quantity.toString()),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      // FutureBuilder better use when we just loading data without change user interface
      // because the content cannot change when function build call again
      body: FutureBuilder(future: _loadedItems, builder: (ctx, snapshot) {
        return _futureBuilder(snapshot);
      },),
    );
  }
}

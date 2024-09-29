import 'package:flutter/material.dart';
import 'package:my_app/data/categories.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  String? _validateName(String? val) {
    if (val == null ||
        val.isEmpty ||
        val
            .trim()
            .length <= 1 ||
        val
            .trim()
            .length > 50) {
      return "Must be between 1 and 50 characters";
    }
    return null;
  }

  String? _validateQuantity(String? val) {
    if (val == null ||
        val.isEmpty ||
        int.tryParse(val) == null ||
        int.tryParse(val)! <= 0) {
      return "Must be between 1 and 50 characters";
    }
    return null;
  }

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(GroceryItem(id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (value) {
                  return _validateName(value);
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      keyboardType: TextInputType.name,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        return _validateQuantity(value);
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        // because categories is a map, so we can't loop it like a list
                        // we need to convert it to a map can loop by entries property
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title)
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    _formKey.currentState!.reset();
                  }, child: const Text("reset")),
                  ElevatedButton(
                      onPressed: _saveItem, child: const Text("Add item"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

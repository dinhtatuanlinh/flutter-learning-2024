import 'package:flutter/material.dart';
import 'package:my_app/screens/tabs.dart';
import 'package:my_app/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
}
class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;
  const FiltersScreen({super.key, required this.currentFilters});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("your Filter"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == "meals") {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // },),

      // PopScope is used to pass data when the screen is popped. The data is put in param of pop
      // then the data will pass to the push which push this screen on top
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Gluten-fee",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Providers/FiltereMeals_Providers.dart';
import 'package:meals/Widgets/Settings_Switches.dart';

class settings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    Map<Filter, bool> FiltersActivate = ref.watch(Filters);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
          children: [
            SettingListtile(
              title: "Gluten-Free",
              subtitle: "only include gluten-free meals",
              SwitchValue: FiltersActivate[Filter.glutenFree]!,
              triggerSwitch: (IsChecked) => ref
                  .watch(Filters.notifier)
                  .toggleSingleFilter(Filter.glutenFree, IsChecked),
            ),
            SettingListtile(
              title: "Lactose-Free",
              subtitle: "only include lactose-free meals",
              SwitchValue: FiltersActivate[Filter.lactoseFree]!,
              triggerSwitch: (IsChecked) => ref
                  .watch(Filters.notifier)
                  .toggleSingleFilter(Filter.lactoseFree, IsChecked),
            ),
            SettingListtile(
              title: "Vegetarian",
              subtitle: "only include vegetarian meals",
              SwitchValue: FiltersActivate[Filter.vegetarian]!,
              triggerSwitch: (IsChecked) => ref
                  .watch(Filters.notifier)
                  .toggleSingleFilter(Filter.vegetarian, IsChecked),
            ),
            SettingListtile(
              title: "Vegan",
              subtitle: "only include vegan meals",
              SwitchValue: FiltersActivate[Filter.vegan]!,
              triggerSwitch: (IsChecked) => ref
                  .watch(Filters.notifier)
                  .toggleSingleFilter(Filter.vegan, IsChecked),
            ),
          ],
        ),
      ),
    );
  }
}

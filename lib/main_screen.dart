import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_york_times_clone/for_you.dart';
import 'package:new_york_times_clone/games.dart';
import 'package:new_york_times_clone/sections.dart';
import 'package:new_york_times_clone/today.dart';
import 'package:new_york_times_clone/widgets/user_settings.dart';

class MainScreenWindget extends StatefulWidget {
  const MainScreenWindget({super.key});

  @override
  State<MainScreenWindget> createState() => _MainScreenWindgetState();
}

class _MainScreenWindgetState extends State<MainScreenWindget> {
  int _selectedIndex = 0;

  final destinationsData = [
    {'icon': 'today', 'label': ''},
    {'icon': 'for_you', 'label': ''},
    {'icon': 'play', 'label': ''},
    {'icon': 'sections', 'label': ''},
  ]
      .map((i) => NavigationDestination(
          icon: SvgPicture.asset(
            'images/${i['icon']}.svg',
            colorFilter: const ColorFilter.mode(
                Color.fromARGB(255, 185, 185, 185), BlendMode.srcIn),
          ),
          label: i['label'] as String,
          tooltip: '',
          selectedIcon: SvgPicture.asset('images/${i['icon']}.svg')))
      .toList();

  void onSelectedTab(i) {
    if (i == _selectedIndex) return;
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: color,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          shadowColor: Colors.black,
          elevation: 1.5,
          surfaceTintColor: color,
          title: const Text(
            'The New York Times',
            style:
                TextStyle(fontFamily: 'Chomsky', fontSize: 28, wordSpacing: -4),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.person, size: 32),
              onPressed: () {
                showModalBottomSheet<void>(
                    useRootNavigator: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return const UserSettings();
                    });
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: color,
        body: const [
          TodayWidget(),
          ForYouWidget(),
          GamesWidget(),
          SectionsWidget(),
        ][_selectedIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: onSelectedTab,
            destinations: destinationsData,
            indicatorColor: Colors.transparent,
            backgroundColor: color,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 50,
            elevation: 0));
  }
}

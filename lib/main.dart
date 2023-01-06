import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  List icon = [
    AnimatedIcons.add_event,
    AnimatedIcons.arrow_menu,
    AnimatedIcons.close_menu,
    AnimatedIcons.ellipsis_search,
    AnimatedIcons.event_add,
    AnimatedIcons.home_menu,
    AnimatedIcons.list_view,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.menu_close,
    AnimatedIcons.menu_home,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
    AnimatedIcons.search_ellipsis,
    AnimatedIcons.view_list,
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AnimatedIcon",style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: icon.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        alignment: Alignment.center,
                        child: AnimatedIcon(
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          textDirection: TextDirection.ltr,
                          icon: icon[index],
                          progress: animation,
                          size: 50.0,
                          semanticLabel: 'Show menu',
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

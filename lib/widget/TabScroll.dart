import 'package:flutter/material.dart';

class TabScroll extends StatefulWidget {
  TabScroll({Key? key}) : super(key: key);

  @override
  _TabScrollState createState() => _TabScrollState();
}

class _TabScrollState extends State<TabScroll>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: "Meditasyon"),
            const Tab(text: "Hızlı Uyku"),
            const Tab(text: "Doğa"),
            const Tab(text: "Yağmur"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Meditasyon
          Container(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 300,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: <Widget>[
                          Image.network('https://picsum.photos/250?image=9'),
                          //Text('Meditasyon $index'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Hızlı Uyku
          Container(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Image.network('https://picsum.photos/250?image=9'),
                        Text('Hızlı Uyku $index'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Doğa
          Container(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Image.network('https://picsum.photos/250?image=9'),
                        Text('Doğa $index'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Yağmur
          Container(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Image.network('https://picsum.photos/250?image=9'),
                        Text('Yağmur $index'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

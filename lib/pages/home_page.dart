import 'package:estudos_flutter/pages/home_page.dart';
import 'package:estudos_flutter/models/time.dart';
import 'package:estudos_flutter/pages/time_page.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Brasileirão',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int time) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[time].brasao),
            title: Text(tabela[time].nome),
            trailing: Text(
              tabela[time].pontos.toString(),
            ),
            onTap: () {
              Navigator.push(
                  contexto,
                  MaterialPageRoute(
                    builder: (_) => TimePage(
                      key: Key(tabela[time].nome),
                      time: tabela[time],
                    ),
                  ));
            },
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}

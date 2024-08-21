import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  Future<List<String>> getNames() async {
    await Future.delayed(const Duration(seconds: 5));
    //quando coloca await precisa por async, metodo é assincrono,
    // nao retorna uma lista retorna uma future de lista
    return [
      'Pedro',
      'Paulo',
      'Rafael',
      'Joao',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNames(),
      builder: (context, snapshot) {
        //snapshot = pegando momento atual da future
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Ocorreu um erro'),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          //data é nulo pois nulo significa que nao vai carregar
          //coloca a ! pra ele ignorar o nulo
          itemBuilder: (context, index) {
            return Text(snapshot.data![index]);
          },
        );
      },
    );
  }
}

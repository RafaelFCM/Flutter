import 'package:flutter/material.dart';
import 'contato.dart';

void main() {
  runApp(MyApp());
}

List<Contato> contatos = [
  Contato(
    titulo: 'João',
    subtitulo: 'joao@email.com',
    imagem: '../images/ney.jpg',
  ),
  Contato(
    titulo: 'Maria',
    subtitulo: 'maria@email.com',
    imagem: '../images/tigre.jpg',
  ),
  Contato(
    titulo: 'Pedro',
    subtitulo: 'pedro@email.com',
    imagem: '../images/ney.jpg',
  ),
  Contato(
    titulo: 'Ana',
    subtitulo: 'ana@email.com',
    imagem: '../images/tigre.jpg',
  ),
  Contato(
    titulo: 'Carlos',
    subtitulo: 'carlos@email.com',
    imagem: '../images/ney.jpg',
  ),
  Contato(
    titulo: 'Julia',
    subtitulo: 'julia@email.com',
    imagem: '../images/tigre.jpg',
  ),
  Contato(
    titulo: 'Lucas',
    subtitulo: 'lucas@email.com',
    imagem: '../images/ney.jpg',
  ),
  Contato(
    titulo: 'Mariana',
    subtitulo: 'mariana@email.com',
    imagem: '../images/tigre.jpg',
  ),
  Contato(
    titulo: 'Gustavo',
    subtitulo: 'gustavo@email.com',
    imagem: '../images/ney.jpg',
  ),
  Contato(
    titulo: 'Camila',
    subtitulo: 'camila@email.com',
    imagem: '../images/tigre.jpg',
  ),
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contadorFavoritos = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contatos Favoritos ($contadorFavoritos)'),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, index) {
            final contato = contatos[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(contato.imagem),
              ),
              title: Text(contato.titulo),
              subtitle: Text(contato.subtitulo),
              trailing: IconButton(
                icon: Icon(
                  contato.favorito ? Icons.favorite : Icons.favorite_border,
                  color: contato.favorito ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    contato.favorito = !contato.favorito;
                    contadorFavoritos =
                        contatos.where((contato) => contato.favorito).length;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

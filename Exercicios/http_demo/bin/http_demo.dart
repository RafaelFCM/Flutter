// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:http_demo/http_demo.dart' as http_demo;

//precisa baixar pacote http pra pegaruma api
//pub.dev site de pacotes do flutter, é tipo o npm do javascript
//https://pub.dev/packages/http/versions
//só rodar essed codigo no terminal do projeto:dart pub add http
//json placeholder site para api falsas, https://jsonplaceholder.typicode.com/
//lembrando que o que vem depois do / é a api, tipo "todos"

import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  final response = await getTodo(1);
  // print(response);
  print(response.title);
  print(response.completed);
}

//metodo com retorno precisa ser diferente de void, String
// Future<String> getTodo() async {
// Future<Map> getTodo(int id) async {
Future<Todo> getTodo(int id) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$id');
  //precisa converter o link em objeto uri, string para uri
  final response = await http.get(url);
  //await espera a resposta porem se coloca await precisa por async

  final Map<String, dynamic> map = jsonDecode(response.body);
  //Dá pra tipar o metodo com dynamic
  // return map;

  // return map['title'];

  return Todo(
    id: map['id'],
    userId: map['userId'],
    title: map['title'],
    completed: map['completed'],
  );

//ai por exemplo nesse json é um array de objetos, ai pra pegar cada objeto a
//partir do seu id usa o map
//jsonDecode quebra e transforma numa estrutura de dados

  // return response.body;

  // print(response.statusCode);
  // print(response.body);
  //resultado esperado 200
  //F5 roda o codigo
}

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });
}

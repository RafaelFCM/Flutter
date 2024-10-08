class Contato {
  final String titulo;
  final String subtitulo;
  final String imagem;
  bool favorito;

  Contato({
    required this.titulo,
    required this.subtitulo,
    required this.imagem,
    this.favorito = false,
  });
}

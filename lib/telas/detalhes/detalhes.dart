import 'package:cozinhando/modelos/receita.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  Detalhes({Key key, @required this.receita}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes(){
    return Scaffold(
      appBar: _construirAppBar(),
      body: ListView(
        children: [
          _construirImagensDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconesDetalhes(
              '${receita.porcoes} porções', receita.tempoPreparo),
          _construirSubtituloDetalhes('Ingredientes'),
          _construirTextoDetalhes(receita.ingredientes),
          _construirSubtituloDetalhes('Modo de preparo da receita', ),
          _construirTextoDetalhes(receita.modoPreparo),

        ],
      ),
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text("Cozinhando em casa",),
      centerTitle: true,
      backgroundColor: Colors.deepOrange,);
  }

  Widget _construirTituloDetalhes(titulo){
    return Text(titulo,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.deepOrange, fontSize: 20),
    );
  }

  Widget _construirImagensDetalhes(imagem){
    return Image.asset(imagem);
  }

  Widget _construirLinhaIconesDetalhes(rendimento, tempo_preparo){
    return Row(
      children: [
        _construirColunasIconesDetalhe(Icons.restaurant, rendimento),
        _construirColunasIconesDetalhe(Icons.timer, tempo_preparo)

      ],
    );
  }
  Widget _construirColunasIconesDetalhe(icone, texto){
    return Expanded(
      child: Column(
        children: [
          Icon(icone, color: Colors.deepOrange,),
          Text(texto, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Widget _construirSubtituloDetalhes(subtitulo){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(subtitulo, style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,),
    );
  }

  Widget _construirTextoDetalhes(texto){
    return Container(
      padding: EdgeInsets.all(16),
        child: Text(texto));
  }


}

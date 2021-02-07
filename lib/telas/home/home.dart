import 'dart:convert';
import 'package:cozinhando/telas/detalhes/detalhes.dart';
import 'package:flutter/material.dart';
import '../../modelos/receita.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      appBar: _construirAppBar(),
      body: _construirListaCard(),
    );
  }

  Widget _construirListaCard() {
    return FutureBuilder(
      future: DefaultAssetBundle
          .of(context)
          .loadString('assets/receitas.json'),
      builder: (context, snapshot){
        List<dynamic> receitas = json.decode(snapshot.data.toString());
        return ListView.builder(
            itemBuilder: (BuildContext context, int index){
              Receita receita = Receita.fromJson(receitas[index]);
              return _construirCard(receita);
            },
          itemCount: receitas == null ? 0 : receitas.length,
        );
      },
    );
  }

  Widget _construirCard(receita) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detalhes(receita: receita,)));
      },
      child: SizedBox(
        height: 300,
        child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(

                children: [
                  _construirImagemCard(receita.foto),
                  _coonstruirGradienteCard(),
                  _construirTextoCard(receita.titulo)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _coonstruirGradienteCard(){
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7),
          ],
        )
      ),
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text("Cozinhando em casa",),
      centerTitle: true,
      backgroundColor: Colors.deepOrange,);
  }

  Widget _construirTextoCard(titulo) {
    return Positioned(
      child: Text(titulo,
        style: TextStyle(fontSize: 20, color: Colors.white),),
      bottom: 10,
      left: 10,
    );
  }

  Widget _construirImagemCard(foto) {
    return Image.asset(foto,
      fit: BoxFit.fill, height: 268,
    );
  }
}


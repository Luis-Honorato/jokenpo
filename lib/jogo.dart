import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({ Key? key }) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var imagemApp = AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String opcaoUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this.imagemApp = AssetImage("assets/images/pedra.png");
        });
        break;
        case "papel":
        setState(() {
          this.imagemApp = AssetImage("assets/images/papel.png");
        });
        break;
        case "tesoura":
        setState(() {
          this.imagemApp = AssetImage("assets/images/tesoura.png");
        });
        break;
    }
    
    if(
      (opcaoUsuario == "pedra" && escolhaApp == "tesoura") ||
      (opcaoUsuario == "papel" && escolhaApp == "pedra") ||
      (opcaoUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Você Venceu!";
      });
    } else if(
      (opcaoUsuario == "pedra" && escolhaApp == "papel") ||
      (opcaoUsuario == "papel" && escolhaApp == "tesoura") ||
      (opcaoUsuario == "tesoura" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    } else{
      setState(() {
        this._mensagem = "Empate!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra Papel Tesoura"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do APP",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Image(image: this.imagemApp),

          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              GestureDetector(
                onTap: () =>  _opcaoSelecionada("pedra"),
                child: Image.asset("assets/images/pedra.png", height: 100,) ,
              ),

               GestureDetector(
                onTap: () =>  _opcaoSelecionada("papel"),
                child: Image.asset("assets/images/papel.png", height: 100,) ,
              ),

              GestureDetector(
                onTap: () =>  _opcaoSelecionada("tesoura"),
                child: Image.asset("assets/images/tesoura.png", height: 100,) ,
              ),
        
            ],
          )

        ],
      ),
    );
  }
}
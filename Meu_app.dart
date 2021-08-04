import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

class Meu_app extends StatefulWidget {
  @override
  _Meu_appState createState() => _Meu_appState();
}

class _Meu_appState extends State<Meu_app> {
  var _imagemApp = AssetImage("img/app_logo.png");

  TextEditingController _controller_alcool = TextEditingController();
  TextEditingController _controller_gasolina = TextEditingController();
  String _texto_resultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controller_alcool.text);
    double precoGasolina = double.tryParse(_controller_gasolina.text);

    if( precoAlcool == null || precoGasolina == null){
        print("numero invalido ");
        setState(() {
          _texto_resultado = "Número invalido, utilize numeros maiores que 0, e ainda utilize um ' . ' em casas decimais";

        });


    }else{

        if (precoAlcool <=0 && precoGasolina <=0){
          setState(() {
            _texto_resultado = ("nenhum dos valores pode está abaixo de zero (0).");
          });

        }else{
          if (precoAlcool/precoGasolina >=0.7){
          setState(() {
            _texto_resultado = "Melhor abastecer com gasolina";

          });

        }else{
            setState(() {
              _texto_resultado = "Melhor abastecer com álcool";
            });

          }
        }


    }

  }
  void _limparCampos(){
    _controller_gasolina.text = "";
    _controller_alcool.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GASOLINA OU ÁLCOOL!"),
      ),
      body:
        Container(

          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[



                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child:
                  Image(image: _imagemApp,height: 100),),

                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text("Saiba qual é a melhor opção para abastecer seu Carro",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child:
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Preço do álcool. "
                    ),
                    style: TextStyle(
                        fontSize: 22
                    ),
                    controller: _controller_alcool,
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child:
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço da gasolina. ",


                    ),
                    style: TextStyle(
                        fontSize: 22
                    ),
                    controller: _controller_gasolina,
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Calcular",
                          style:
                          TextStyle(
                            fontSize: 22,

                          )),

                      padding: EdgeInsets.only(top: 15,bottom: 15,left: 50,right: 50),




                      onPressed: _calcular,

                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 10),
                  child: Text(
                    _texto_resultado,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600]
                    ),
                  ),
                ),

          Padding(padding: EdgeInsets.only(top: 0,bottom: 5),
          child: RaisedButton(
            color: Colors.blue[200],
            textColor: Colors.white,
            child: Text("Limpar campos",
                style:
                TextStyle(
                  fontSize: 22,
                  color: Colors.white

                )),

            padding: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),




            onPressed: _limparCampos,

          ),
        ),
              ],
            ),
          )
        )


    );
  }
}

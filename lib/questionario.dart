import 'package:flutter/cupertino.dart';
import 'package:procjet/questao.dart';
import 'package:procjet/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({ 
      Key? key, 
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder
   }) : super(key: key);

    bool get temPerguntaSelecionada {
      return perguntaSelecionada < perguntas.length;
    }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['respostas'] : [];

    return Column(
      children: [
          Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
          ...respostas.map((resp) => Reposta(texto:resp['texto'].toString(), responder: () => responder(int.parse(resp['nota'].toString())))).toList() 
      ],
    );
  }
}
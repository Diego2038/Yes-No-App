


import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    // Message(text: "Hola", fromWho: FromWho.mine),
    // Message(text: "Jajajaa saludos ", fromWho: FromWho.hers)
  ];


  final ScrollController chatScrollController = ScrollController();

  
  Future<void> sendMessage( String text ) async {

    if( text.isEmpty ) return;

    messageList.add(
      Message(
        text: text, fromWho: FromWho.mine
      )
    );

    if ( text.endsWith("?") ) getMessageOther();

    notifyListeners(); // ! Notificar el cambio 
    messageToBottom();
  }

  void messageToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut);

  }

  void getMessageOther() async{
    final Message message = await getYesNoAnswer.getAnswer();
    messageList.add(message);
    notifyListeners();
    messageToBottom();
  }

}
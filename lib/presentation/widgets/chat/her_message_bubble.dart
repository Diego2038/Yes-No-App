import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget{

  final Message message;
  
  const HerMessageBubble({
    super.key, 
    required this.message
  });
 
  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              message.text, 
              style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5,),
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(height: 10,)
      ],
    );
  }

}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;
  const _ImageBubble({required this.imageUrl}); 

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null){
            return child;
          }
          return SizedBox(
            width: size.width * 0.7,
            height: 150,
            child: const Text("Te están enviando un mensaje"),
          );
        },
      )
    );
  }
}
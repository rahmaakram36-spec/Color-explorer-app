import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorDetailScreen extends StatelessWidget{
  final Color color;
  final String name;
  const ColorDetailScreen({
    super.key,
    required this.color,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: color,
    body: Center(
      child: Column( mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
           child: Text("Back!", style: TextStyle(color: Colors.black,
           fontSize: 15,
           fontStyle: FontStyle.italic),))
        ],
      ),
    ),
   );
    
  }
    

}
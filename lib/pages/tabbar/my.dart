import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/provider/appState.dart';


class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   AppStateData notifier = Provider.of(context);
   notifier.changeBarState;
   return AnnotatedRegion(
         value:SystemUiOverlayStyle.dark,
         child:Scaffold(
           backgroundColor: Colors.white,
           body:Column(
             children: [
               Container(
                 child: Column(
                   children: [
                     Container(
                       width:MediaQuery.of(context).size.width,
                       height: 404,
                       child: Row(
                         children: [


                         ],
                       ),
                       decoration: BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage(
                                 'images/my/my_head.png'),
                             fit: BoxFit.cover,
                           )
                       ),
                     )
                   ],
                 ),
               )
             ],
          ),
         floatingActionButton:FloatingActionButton(
           onPressed: notifier.changeBarState,
           tooltip: 'Increment',
           child: Icon(Icons.add),
         ),
       ),
   );
  }
  Widget MyModel(){
    return Text('321');
  }
}

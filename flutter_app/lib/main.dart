import 'package:flutter/material.dart';

void main () => runApp(MyApp(
	items:new List<String>.generate(100, (i)=>"Item $i")
));

class MyApp extends StatelessWidget{

	final List<String> items;
	MyApp({Key key, @required this.items}):super(key:key);
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title:'ListView widget',
      home:Scaffold(
		  body:new ListView.builder(
			  itemCount:items.length,
			  itemBuilder:(context,index){
				  return new ListTile(
					  title:new Text('${items[index]}')
				  );
			  }
		  )
        // body:Center(
        //   //Text组件
        //   child:Text(
        //     'Holle Word! LRX  你好AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        //     textAlign: TextAlign.center,
        //     overflow:TextOverflow.ellipsis,
        //     // maxLines: 1,
        //     style: TextStyle(
        //       fontSize: 25.0,
        //       color: Color.fromARGB(255, 255, 150, 150),
        //       decoration: TextDecoration.underline,
        //       // decorationStyle:TextDecorationStyle.solid
        //     ),
        //     )

        //   //Container组件
        //   child:Container( 
        //     child:new Text("Heloo LRX",style:TextStyle(fontSize:60.0)),
        //     alignment:Alignment.topLeft,
        //     width:1000.0,
        //     height:400.0,
        //     // color:Colors.lightBlue,
        //     padding:const EdgeInsets.all(50.0),
        //     margin:const EdgeInsets.all(20.0),
        //     decoration:new BoxDecoration(
        //       gradient:const LinearGradient(
        //         colors:[Colors.lightBlue,Colors.greenAccent,Colors.purple]
        //       ),
        //       border:Border.all(width:2.0,color:Colors.red)
        //     ),
        //   )
        // )
      )
    );
  }
}
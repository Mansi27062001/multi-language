import 'localization_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  String lng;
  @override
  void initState(){
    super.initState();
    lng= LocailzationService().getCurrentLang();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('flutter multilang'),
        elevation:0,
        backgroundColor: Colors.redAccent,
      ),
      body:Center(
        child: _uiWidget(),
      )
    );
}

Widget _uiWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('hello_title'.tr,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
             "Language",
             style:TextStyle(
            fontSize:20,
            fontWeight: FontWeight.bold
            ),
          ),
         Text(" "),
          new DropdownButton<String>(
            items: LocailzationService.langs.map((String value){
              return new DropdownMenuItem<String>(
                value:value,
                child:new Text(value),
              );
            },
            ).toList(),
            value:this.lng,
            underline:Container(color:Colors.transparent,),
            isExpanded:false,
         onChanged:(newVal){
              setState((){
                this.lng=newVal;
                LocailzationService().changeLocale(newVal);
         });
       }
          )
         ],
        )
      ],
    );
}
}


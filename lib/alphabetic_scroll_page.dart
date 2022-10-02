import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

 class azItem extends ISuspensionBean{
   final String title;
   final String tag;
   azItem({
  required this.title,required this.tag
});

  @override
  String getSuspensionTag() =>tag;
   
}
 class AlphabeticScrollPage extends StatefulWidget {
   final List<String> itmes;
   const AlphabeticScrollPage({Key? key, required this.itmes}) : super(key: key);

  @override
  State<AlphabeticScrollPage> createState() => _AlphabeticScrollPageState();
}

class _AlphabeticScrollPageState extends State<AlphabeticScrollPage> {
   List<azItem> items =[];
   @override
  void initState() {
    super.initState();
    initList(widget.itmes);
  }
  void initList(List<String> itme){
     items =
       itme.map((items) => azItem(title: items, tag: items[0].toUpperCase())).toList();

  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: AzListView(
         data: items,
         itemCount: items.length,
         itemBuilder: (context, index){
           return itemBuild(items[index]);
         },

       ),
     );
   }
   Widget itemBuild(azItem itmes){
     return ListTile(
       title: Text(itmes.title),
     );
   }
}

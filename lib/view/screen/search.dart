import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubite/cube.dart';

import 'splash_screen/webViwe.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final TextEditingController control=TextEditingController();
   final GlobalKey<FormState> form= GlobalKey<FormState>();
    return BlocConsumer<newsCubit,newsStates>(
         listener: (context,state){},
          builder:(context,state){
             newsCubit c=newsCubit.get(context);
             return Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: form,
                        child:Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: TextFormField(
                            controller:control ,
                            cursorColor: Colors.red,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                                fillColor: Color(0xffb91313),
                                labelText: "Search ",
                                labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(
                                    0xffb91313)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              )


                            ),
                            validator: (String? value){
                              if(value==null||value.isEmpty){
                                return "enter some keywords ";
                              }else{
                                return null;
                              }
                            },
                           onChanged: (vall){
                                 print(vall);
                       newsCubit.get(context).getSearch(vall);
                          },

                          ),
                        )
                    ),
                  ),
                 Expanded(
                   child:ListView.separated(
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context,i){
                       return InkWell(
                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                 return WebViewExample(c.Search[i]['url']);
                               }
                           ));
                         },
                         child: Padding(
                           padding: EdgeInsets.all(10),
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Expanded(
                                 flex: 2,
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     image: DecorationImage(
                                         fit: BoxFit.cover,
                                         image:  c.Search[i]['urlToImage']== null ? const NetworkImage(  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTteRtEzT1Zzg-E7tCMWmY96la-_PAMfu6qPCqYZMM9XWl8a1Wfd98yxfZSXtITUa6rHg&usqp=CAU'):NetworkImage( "${c.Search[i]['urlToImage']}")
                                     ),
                                   ),
                                   height: 100,
                                   width: 100,
                                 ),
                               ),
                               SizedBox(width: 10),
                               Expanded(
                                 flex: 4,
                                 child: Container(
                                   height: 100,
                                   child: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Expanded(
                                           child: Text("${c.Search[i]['title']}",style:Theme.of(context).textTheme.bodyLarge,maxLines: 4,overflow: TextOverflow.ellipsis,)
                                       ),
                                       Text("${c.Search[i]['publishedAt'].toString()}",style: TextStyle(fontSize: 12,color: Colors.grey[800]),)
                                     ],
                                     //publishedAt
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       );
                     }
                     , separatorBuilder: (context,i){
                     return Divider(
                       color: Colors.black,
                       height: 2,
                       thickness: 2,
                     );
                   }
                     , itemCount:c.Search.length,//list.length,

                   ),
                 )
               ],
             );
           }
    );
  }
}

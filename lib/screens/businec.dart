import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cube.dart';
import 'package:news/dio/webViwe.dart';


class busines extends StatelessWidget {
  const busines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newCubit, newsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var list = newCubit.get(context).Busines;
        if (   list.length!=0) {
          return ListView.separated(
             physics: BouncingScrollPhysics(),
              itemBuilder: (context,i){
                return GestureDetector(
                  onTap: (){
                    print("pres");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return WebViewExample(list[i]['url']);
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
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIKT0_G6HMSUGtLMvJwbDMNegViOKqURcPJM4RiNokNYM5XWEf6IQxD4-wwolupZexrnA&usqp=CAU'
                                  //'https://qph.cf2.quoracdn.net/main-qimg-51b73d79311f9f986053269187b8f87d-lq'
                                ),
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
                                    child: Text("${list[i]['title']}",style:Theme.of(context).textTheme.bodyLarge,maxLines: 4,overflow: TextOverflow.ellipsis,)
                                ),
                                Text("${list[i]['publishedAt'].toString()}",style: TextStyle(fontSize: 12,color: Colors.grey[800]),)
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
              , itemCount:list.length,//list.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }
}

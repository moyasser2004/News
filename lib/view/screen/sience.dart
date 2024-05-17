import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubite/cube.dart';

import 'splash_screen/webViwe.dart';


class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        List list = newsCubit.get(context).science;
        if ( list.length!=0) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,i){
              return GestureDetector(
                onTap: () {
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
                        child: Image.network(
                          "https://mrslopez18.weebly.com/uploads/2/5/8/3/25836804/science_orig.jpg",
                            height: 100,
                           width: 100,
                        )
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
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
            return const Divider(
              color: Colors.black,
              height: 2,
              thickness: 2,
            );
          }
            , itemCount:list.length,//list.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Entery_Page extends StatefulWidget {
  const Entery_Page({Key? key}) : super(key: key);

  @override
  State<Entery_Page> createState() => _Entery_PageState();
}

class _Entery_PageState extends State<Entery_Page> {
    var pageControle=PageController();
    var page=0;

    List<Widget> pages=[

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:2,child: Container(child: Image.asset("lib/shopImages/one.jpg",fit:BoxFit.fill,height: 300,width: 400,))),
          SizedBox(height: 30,),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text("Statrt page frome here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 30,),
                Text(" saaadsa",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: 30,),

              ],
            ),
          )
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:2,child: Container(child: Image.asset("lib/shopImages/two.jpg",fit:BoxFit.fill,height: 300,width: 400,))),
          SizedBox(height: 30,),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text("Statrt page frome here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 30,),
                Text(" saaadsa",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: 30,),

              ],
            ),
          )
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:2,child: Container(child: Image.asset("lib/shopImages/three.png",fit:BoxFit.fill,height: 300,width: 400,))),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("Statrt page frome here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(height: 30,),
                  Text(" saaadsa",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height: 30,),

                ],
              ),
            )
        ],
      ),

    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (vall){
                  setState(() {
                  page=vall;
                  });
                  },
                controller: pageControle,
                  itemBuilder:(context,i){
                    return  pages[page];
                  },
                physics: BouncingScrollPhysics(),
                itemCount: pages.length,

              ),

            ),
            Row(
              children: [
               SmoothPageIndicator(
                   controller:pageControle,
                   count: pages.length,
                 effect: ExpandingDotsEffect(
                   activeDotColor:Colors.deepOrange,
                   dotColor: Colors.yellow,
                   dotHeight: 15,
                   dotWidth: 15,
                   spacing: 10,
                   expansionFactor: 5,

                 ),
               ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(page==pages.length-1){
                        Navigator.of(context).pushReplacementNamed("Home_Page");
                        }
                     pageControle.nextPage(duration: Duration(seconds: 1), curve: Curves.fastEaseInToSlowEaseOut);
                    },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

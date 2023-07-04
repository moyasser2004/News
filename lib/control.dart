import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/setting.dart';
import 'cube.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<newCubit,newsStates>(
            listener: (context,state){},
            builder: (context,state){
               var c=newCubit.get(context);
              double screenWidth = MediaQuery.of(context).size.width;
              return Scaffold(
                appBar: AppBar(
                  title: Text(" News App"),
                  actions: [
                    IconButton(
                        onPressed:(){
                          c.isDark();
                          print(c.bol);
                        }
                        , icon: Icon(Icons.dark_mode_outlined)
                    ),
                  ],
                ),
                bottomNavigationBar: Container(
                  margin:  EdgeInsets.all(20),
                  height: screenWidth * .155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 30,
                        offset:  Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {

                          HapticFeedback.lightImpact();
                          c.curentIndex(index);

                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: screenWidth * .2125,
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: index == c.currentIndex ? screenWidth * .12 : 0,
                                width: index == c.currentIndex ? screenWidth * .2125 : 0,
                                decoration: BoxDecoration(
                                  color: index == c.currentIndex
                                      ? Colors.black.withOpacity(.9)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * .2125,
                            alignment: Alignment.center,
                            child: Icon(
                              c.listOfIcons[index],
                              size: screenWidth * .076,
                              color: index == c.currentIndex
                                  ? Color(0xff8d1610)
                                  : Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body:c.pages[c.currentIndex],

              );
            }

    );



  }
}




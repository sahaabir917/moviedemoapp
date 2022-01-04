import 'dart:ffi';

import 'package:demo_work/controller/movie_controller.dart';
import 'package:demo_work/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AllMoviePage extends StatefulWidget {


  @override
  _AllMoviePageState createState() => _AllMoviePageState();
}

class _AllMoviePageState extends State<AllMoviePage> {
  ColorUtil colorUtil = ColorUtil();
  final MovieController movieController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(colorUtil.hexColor("#000000")),
          title: Text("New Hip Hop Songs"),
        ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color:Color(colorUtil.hexColor("#272731")),
        child: Obx(() {
          if (movieController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else{
            return  Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: [
                      GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: .43,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: movieController.movieList.length,
                      itemBuilder: (ctx, i) => GestureDetector(
                        onTap:(){
                          OnTapped(i);
                        } ,
                        child: GridTile(
                          child: Container(
                            color: Color(colorUtil.hexColor("#000000")),
                            child:Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.black,
                                  height:MediaQuery.of(context).size.height*.33,
                                  child: Stack(
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        height:MediaQuery.of(context).size.height*.2,
                                        child: Image.asset(movieController.movieList[i].image,height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                                      ),
                                      Positioned(top: MediaQuery.of(context).size.height*.21,child: Container(width:MediaQuery.of(context).size.width*.3,padding:EdgeInsets.only(left: 10,right: 10),child: Align(child: Text(movieController.movieList[i].movieName,style: TextStyle(color: Colors.white,fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),alignment: Alignment.center,))),
                                      Positioned(right: 5,bottom: 35,child: Container(width:MediaQuery.of(context).size.width*.26,child: Align(child: Text(movieController.movieList[i].writer,style: TextStyle(color: Colors.white,fontSize: 11),),alignment: Alignment.bottomRight,)))
                                    ],
                                  ),
                                ),


                              ],
                            )
                          ),
                        ),
                      )),
                    ],
              ),
            );
          }
        })
      ),
    );
  }

  OnTapped(int i) {
    print("index"+i.toString());
    movieController.setSelectedIndex(i);
    Navigator.pushNamed(context, "/movie_details",arguments: {'index': i});
  }
}

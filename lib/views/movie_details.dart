import 'package:demo_work/controller/movie_controller.dart';
import 'package:demo_work/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {


  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  int index;
  final MovieController movieController = Get.put(MovieController());
  ColorUtil colorUtil = ColorUtil();
  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      this.index = arguments['index'];
      movieController.getMovieDetails(this.index);
      print(this.index);
    }
    return Scaffold(
    body: Container(
      color: Color(colorUtil.hexColor("#292c35")),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,top: 30),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*.3,
                  height: MediaQuery.of(context).size.height*.2,
                  color: Colors.yellow,
                  child: Image.asset(movieController.movieList[index].image,height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.6,
                  height: MediaQuery.of(context).size.height*.2,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.topLeft,child: Padding(padding:EdgeInsets.only(left: 10),child: Text(movieController.movieList[index].movieName,style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.start,))),
                      SizedBox(height: 10,),
                      Align(alignment:Alignment.topLeft,child: Padding(padding: EdgeInsets.only(left: 10),child: Text(movieController.movieList[index].movieName + " - sakjdhk",style: TextStyle(color: Colors.white,fontSize: 13),textAlign: TextAlign.start))),
                      SizedBox(height: 10,),
                      Align(alignment:Alignment.topLeft,child: Padding(padding: EdgeInsets.only(left: 10),child: Text(movieController.movieList[index].relasedate,style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.start))),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Container(
              height: MediaQuery.of(context).size.height*.08,
              width: MediaQuery.of(context).size.width,
              color: Color(colorUtil.hexColor("#3c3f48")),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebook,color: Colors.white)),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagram,color:Colors.white)),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.twitter,color:Colors.white)),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.shareAlt,color:Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height*.6,
            child : ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Container(
                      child: Text(movieController.movieList[index].movieName+" - sakjdh | New Hip Hop Songs (videos)" ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                    )
                ),
                SizedBox(height: 20,),
                Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Container(
                      child: Text(movieController.movieList[index].description,style: TextStyle(fontSize: 14,color: Colors.white),),
                    )
                ),
                SizedBox(height: 20,)
              ],
            )
          )

        ],
      ),
    )

    );
  }

  @override
  void initState() {

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/post_model.dart';
import 'package:flutter_advanced/services/http_services.dart';
import 'package:flutter_advanced/services/log_services.dart';
import 'package:flutter_advanced/services/utils_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _apiPostList();
    var post = Post(id: 1,title: "Begzod",body: "online",userId: 1);
  //  _apiPostCreate(post);
  //  _apiPostUpdate(post);
    _apiPostDelete(post);
  }
  void _apiPostList(){
Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
  LogServices.i(response.toString()),

  });
}



  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) =>
    {
      LogServices.i(response.toString())
    });
  }

  _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.userId.toString(), Network.paramsUpdate(post)).then((response) =>
    {
      LogServices.i(response.toString())
    });
  }


  _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE+post.userId.toString(), Network.paramsEmpty()).then((response) =>
    {
      LogServices.i(response.toString()),
    });
  }


    _showRespone(){

    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Flutter modul 6'),
      ),
      body: Container(
      child: Text(''),
      ),
    );

  }
}

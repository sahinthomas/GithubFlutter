import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github/Models/SearchModel.dart';
import 'package:github/Profile/ProfilePage.dart';
import 'package:github/Utils/AppPalette.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:http/http.dart' as http;
class SearchResultPage extends StatefulWidget {


  List<Item> searchResults;
  String userName;
  String count;



  SearchResultPage({required this.searchResults, required this.userName, required this.count});


  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {


  int p=2;
  bool isLoading=false;

  Future loadMore()async{

    setState(() {
      isLoading=true;
    });


    String searchUrl="https://api.github.com/search/users?q=${widget.userName}&page=$p&per_page=60";

    try {
      var response = await http.get(Uri.parse(searchUrl));


      if (response.statusCode == 200) {

        print(response.body);

        var msg=   userSearchFromJson(response.body);



        if(msg.totalCount!="0"){

          p++;

          widget.searchResults.addAll(msg.items);



        }


      }
    }on SocketException catch (e) {
     ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check your internet connection")));


    }


    catch(e){


      print(e);
    }

    setState(() {
      isLoading=false;
    });

  }



  @override
  Widget build(BuildContext context) {

    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;

    return Scaffold(


      appBar: AppBar(

        leading:Navigator.canPop(context)? IconButton(icon: Icon(Icons.arrow_back,color: AppPalette.secondaryColor,), onPressed: (){

       Navigator.pop(context);

        },):Container(),

        title: Text("Result For: ${widget.userName.toUpperCase()}", style: TextStyle(color: AppPalette.secondaryColor, fontSize: 14),),
        elevation: 0,
        backgroundColor: AppPalette.whiteColor,


      ),

      body: Container(
        color: AppPalette.whiteColor,



        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: height*.02,),

              Text("Total Results Found: ${widget.count}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              SizedBox(height: height*.02,),
              Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: () => loadMore(),
                  //scrollOffset: 200,
                  isLoading: isLoading,
                  child: ListView.builder(
                  itemCount: widget.searchResults.length,
                  shrinkWrap: true,



                  itemBuilder: (BuildContext context,int index){
                    return ListTile(

                      onTap: (){


                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePage(username:widget.searchResults[index].login ,)));

                      },
                        leading: CircleAvatar(


                          backgroundColor: AppPalette.lightPrimaryColor,

                          backgroundImage: NetworkImage("${widget.searchResults[index].avatarUrl}"),

                        ),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        title:Text("${widget.searchResults[index].login}"),
                      subtitle: Text(""),
                      isThreeLine: false,
                    );
                  }
          ),
                ),
              ),


          ],),
        ),
      ),



    );
  }
}
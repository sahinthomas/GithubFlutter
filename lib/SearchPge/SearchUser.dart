import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github/Models/SearchModel.dart';
import 'package:github/SearchPge/SearchResultPage.dart';
import 'package:github/Utils/AppPalette.dart';
import 'package:github/Utils/Loading.dart';
import 'package:github/Utils/Theme.dart';
import 'package:github/Utils/Validator.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {


  SearchPage();


  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final formKeySearch = GlobalKey<FormState>();


  TextEditingController usernameController= TextEditingController();


  Future searchUser() async{


    Dialogs.showLoadingDialog(context);
    bool showLoading=true;

    String searchUrl="https://api.github.com/search/users?q=${usernameController.text}&per_page=60";

    try{


   var response=  await  http.get(Uri.parse(searchUrl));


   if(response.statusCode==200){

     print(response.body);

  var msg=   userSearchFromJson(response.body);



if(msg.totalCount!="0"){

    if(showLoading){

      showLoading=false;
      Navigator.pop(context);

    }

    Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchResultPage(searchResults: msg.items, userName:usernameController.text, count: msg.totalCount,)));


  }else{


  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No results found for your search")));


  }



   }else{
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong please try again later")));



   }





    }on SocketException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check your internet connection")));


    }



    catch(e){

      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong please try again later")));



    }

    if(showLoading){

      showLoading=false;
      Navigator.pop(context);

    }


  }



  @override
  Widget build(BuildContext context) {

    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;

    return Scaffold(


      appBar: AppBar(

        elevation: 0,

        backgroundColor: AppPalette.whiteColor,



      ),

      backgroundColor: AppPalette.whiteColor,

      body: Container(
        width: width,
        height: height,
        color: AppPalette.whiteColor,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


               // Text("Github User Search", style: TextStyle(color: AppPalette.primaryColor, fontWeight: FontWeight.bold, fontSize: 19),),

                SizedBox(height: height*.03,),


              Image.asset("assets/images/githubLogo.png"),

                SizedBox(height: height*.07,),

              Form(

                key: formKeySearch,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Username", style: TextStyle(color: AppPalette.secondaryColor,fontWeight: FontWeight.w500),)),


                    SizedBox(height: height*.01,),

                    Container(
                      width: width*.9,

                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: usernameController,

                        decoration: InputDecoration(

                            focusColor: AppPalette.textboxColor,

                            hintStyle: TextStyle(fontSize: 13),
                            errorMaxLines: 3,
                            hintText:"Username",
                            contentPadding: EdgeInsets.all(15.0),

                            border: outLineBorder,
                            enabledBorder: outLineBorder,
                            focusedBorder:outLineBorder,
                            filled: true,
                            //  fillColor: const Color.fromRGBO(66, 187, 236, 100),
                            fillColor: Colors.white),

                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,



                        validator: (value){

                          if(value!.isEmpty){

                            return "Please enter a username";
                          }



                          RegExp regExp = new RegExp(Validations().userName);

                          if (regExp.hasMatch(value)){



                            return null;

                          }

                          return "Username may only contain alphanumeric characters or single hyphens, and cannot begin or end with a hyphen";


                        },
                      ),
                    ),


                    SizedBox(height: height*.03,),


                    ElevatedButton(onPressed: (){

                      if(formKeySearch.currentState!.validate()){

                        searchUser();

                      }




                    }, child: Text("Search"), style:  ElevatedButton.styleFrom(
                        primary: AppPalette.primaryColor,

                        textStyle: TextStyle(

                            fontWeight: FontWeight.bold)),),

                  ],


                ),



              ),



                SizedBox(height: height*.07,),

            ],),
          ),
        ),
      ),



    );
  }
}
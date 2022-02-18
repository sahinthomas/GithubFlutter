
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github/Models/UserDetails.dart';
import 'package:github/Models/UserRpos.dart';

import 'package:github/Utils/AppPalette.dart';
import 'package:github/Webview/WebView.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';


class ProfilePage extends StatefulWidget {


  String username;

  ProfilePage({required this.username});



  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  bool loading=true;
  bool loadingRes=true;


  @override
  void initState() {
    // TODO: implement initState
    getProfileData();
    getRepositories("");
    super.initState();
  }

  UserDetail userDetail= UserDetail(login: "", id: "", nodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: "", name: "", company: "", blog: "", location: "", email: "", hireable: "", bio: "", twitterUsername: "", publicRepos: "", publicGists: "", followers: "", following: "", createdAt: "", updatedAt: "");

  bool noInternet=false;

  Future getProfileData() async{

    print("Profilessss");
    setState(() {
      loading=true;
      noInternet=false;
    });
    //https://api.github.com/users/sahinthomas

    String searchUrl="https://api.github.com/users/${widget.username}";


    try{

     var response= await http.get(Uri.parse(searchUrl));
     print(response.statusCode);
     print(response.body);


     if(response.statusCode==200||response.statusCode==201 ){

     var msg=  userDetailFromJson(response.body);

     print(response.body);


     userDetail=msg;

     print(msg);



     }




    }
    on SocketException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check your internet connection")));

      noInternet=true;

    }

    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong please try again later")));



      print(e);

    }

    setState(() {
      loading=false;

    });

  }



  List<UserRepos> userRepoList=[];
  
  Future getRepositories(String sort) async{
    setState(() {
      loadingRes=true;
      userRepoList.clear();
      noInternet=false;
    });
    
    try{
      //https://api.github.com/users/sahinthomas/repos"


      String searchUrl="https://api.github.com/users/${widget.username}/repos?q=&type=all&language=&sort=$sort";
      
      var response= await http.get(Uri.parse(searchUrl));

      if(response.statusCode==200){

       // print("Repo: ${response.body}");

        var msg= userReposFromJson(response.body);

        userRepoList=msg;
        print(userRepoList.length);



      }
      
      
      
    }
    on SocketException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check your internet connection")));

      noInternet=true;

    }


    catch(e){

      print(e);
      
      
    }
    
    setState(() {
      loadingRes=false;
    });
    
    
  }






  Future loadMore() async{



  }
  
  

  @override
  Widget build(BuildContext context) {

    double Height= MediaQuery.of(context).size.height;
    double Width= MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(

          title: const Text("Profile", style: TextStyle(color: AppPalette.secondaryColor),),
          centerTitle: true,
          leading:Navigator.canPop(context)? IconButton(icon: Icon(Icons.arrow_back,color: AppPalette.secondaryColor,), onPressed: (){

            Navigator.pop(context);

          },):Container(),

          elevation: 0,
          backgroundColor: AppPalette.whiteColor,

          actions: [


          ],

          bottom: TabBar(
            labelColor: AppPalette.primaryColor,
            indicatorColor: AppPalette.textboxColor,
            unselectedLabelColor: AppPalette.secondaryColor,
            tabs: [
              Tab(text: "Profile",),
              Tab(text:"Repositories" ,),
            ],
          ),
        ),

        backgroundColor: AppPalette.whiteColor,

        body:TabBarView(

          children: [

            loading?Container(
              width: Width,
              height: Height,
              color: AppPalette.whiteColor,


              child: Center(


                child: Column(

                  children: [
                    Spacer(),
                    CircularProgressIndicator(),

                    Spacer(),
                    Text("Loading Profile Details", style: TextStyle(color: AppPalette.secondaryColor, fontWeight: FontWeight.bold),),

                    SizedBox(height: Height*.15,)


                  ],
                ),

              ),


            ):       Container(
              width: Width,
              color: AppPalette.whiteColor,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: Width*.05),
                child: SingleChildScrollView(
                  child: Column(children: [

                    SizedBox(height: Height*.02,),

                     CircleAvatar(
                      foregroundImage: NetworkImage('${userDetail.avatarUrl}'),

                      radius: Width*.2,
                      backgroundColor:AppPalette.secondaryColor ,

                    ),


                    SizedBox(height: Height*.02,),


                    Text("${userDetail.name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppPalette.secondaryColor),),


                    Text("${userDetail.bio}", style: TextStyle(color: AppPalette.secondaryColor, fontSize: 14),),

                    SizedBox(height: Height*.02,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        GestureDetector(
                          onTap: (){




                          },
                          child: Container(

                            height: Width*.17,


                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: Width*.03),
                                child: Text("Public Repositories: ${userDetail.publicRepos}", style: TextStyle(color: AppPalette.secondaryColor, fontWeight: FontWeight.bold),),
                              )),


                            ),


                          ),
                        ),

                        GestureDetector(
                          onTap: (){




                          },
                          child: Container(

                            height: Width*.17,


                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: Width*.03),
                                child: Text("${userDetail.followers} Followers", style: TextStyle(color: AppPalette.secondaryColor, fontWeight: FontWeight.bold),),
                              )),


                            ),


                          ),
                        ),



                      ],


                    ),

                    SizedBox(height: Height*.01,),


                    Divider(),
                    SizedBox(height: Height*.01,),

                    Row(

                      children: [


                        const  Text("Company", style: TextStyle(fontWeight: FontWeight.bold),),

                        const Spacer(),
                        Text("${userDetail.company}",style: TextStyle(fontWeight: FontWeight.bold,color: AppPalette.primaryColor),)


                      ],


                    ),

                    Divider(),
                    SizedBox(height: Height*.01,),

                    Row(

                      children: [


                        const  Text("Email", style: TextStyle(fontWeight: FontWeight.bold),),

                        const Spacer(),
                        Text("${userDetail.email}",style: TextStyle(fontWeight: FontWeight.bold,color: AppPalette.primaryColor),)


                      ],


                    ),

                    Divider(),
                    SizedBox(height: Height*.01,),


                    Row(

                      children: [


                        const  Text("Location", style: TextStyle(fontWeight: FontWeight.bold),),

                        const Spacer(),
                        Text("${userDetail.location}",style: TextStyle(fontWeight: FontWeight.bold,color: AppPalette.primaryColor),)


                      ],


                    ),

                    Divider(),
                    SizedBox(height: Height*.01,),

                    Row(

                      children: [


                        const  Text("Twitter", style: TextStyle(fontWeight: FontWeight.bold),),

                        const Spacer(),
                        Text("${userDetail.twitterUsername}",style: TextStyle(fontWeight: FontWeight.bold,color: AppPalette.primaryColor),)


                      ],


                    ),

                    Divider(),

                    SizedBox(height: Height*.01,),


                    if(noInternet)
                    ElevatedButton(child: Text("Retry"),onPressed: (){

                      getProfileData();
                      getRepositories("");

                    },),

                    SizedBox(height: Height*.03,),




                  ],),
                ),
              ),
            ),



            loadingRes?Container(
              width: Width,
              height: Height,
              color: AppPalette.whiteColor,


              child: Center(


                child: Column(

                  children: [
                    Spacer(),
                    CircularProgressIndicator(),

                    Spacer(),
                    Text("Loading Repository Details", style: TextStyle(color: AppPalette.secondaryColor, fontWeight: FontWeight.bold),),

                    SizedBox(height: Height*.15,)


                  ],
                ),

              ),


            ):


               Container(


                 child: Padding(
                   padding:  EdgeInsets.symmetric(horizontal: Width*.05),
                   child: Column(

                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [


                       SizedBox(height: Height*.02,),
                       Text("Repositories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                       SizedBox(height: Height*.02,),
                       Expanded(
                         child: LazyLoadScrollView(
                           onEndOfPage: () => loadMore(),
                           //scrollOffset: 200,
                           isLoading: false,
                           child: ListView.builder(
                               itemCount:userRepoList.length ,
                               shrinkWrap: true,



                               itemBuilder: (BuildContext context,int index){
                                 return ListTile(

                                   onTap: (){


                                     Navigator.push(context, MaterialPageRoute(builder: (_)=>WebViewPage(webUrl:"${userRepoList[index].html_url}", title: "${userRepoList[index].name}",)));

                                   },

                                   trailing: Icon(Icons.arrow_forward_ios_sharp),
                                   title:Text("${userRepoList[index].name}"),
                                   subtitle: Text(""),
                                   isThreeLine: false,
                                 );
                               }
                           ),
                         ),
                       ),

                       if(noInternet)
                         Center(
                           child: ElevatedButton(child: Text("Retry"),onPressed: (){
                             getRepositories("");
                             getProfileData();


                           },),
                         ),

                       SizedBox(height: Height*.03,),



                       if(!noInternet)
                       Container(
                         width: Width,
                         child: Row(

                           children: [

                             ElevatedButton(onPressed: (){

                               showModalBottomSheet<void>(
                                 context: context,
                                 builder: (BuildContext context) {
                                   return Container(
                                     height: Height*.3,

                                     color: AppPalette.whiteColor,
                                     child: Center(
                                       child: Padding(
                                         padding:  EdgeInsets.symmetric(horizontal: Width*.05),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             SizedBox(height: Height*.02,),
                                             Padding(
                                             padding:  EdgeInsets.symmetric(horizontal: Width*.03),
                                               child: Text("Sort By", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                             ),

                                             SizedBox(height: Height*.02,),
                                             ListTile(

                                               dense: true,
                                               onTap: (){

                                                 getRepositories("");
                                                 Navigator.pop(context);

                                               },
                                               title: Text("Last Updated"),
                                               isThreeLine:false,
                                               subtitle: Text(""),


                                             ),

                                             ListTile(
                                               dense: true,
                                               onTap: (){

                                                 getRepositories("name");

                                                 Navigator.pop(context);
                                               },
                                               title: Text("Name"),
                                               isThreeLine:false,
                                               subtitle: Text(""),


                                             ),

                                             ListTile(
                                               dense: true,

                                               onTap: (){


                                                 getRepositories("stargazers");
                                                 Navigator.pop(context);

                                               },
                                               title: Text("Star"),
                                               isThreeLine:false,
                                               subtitle: Text(""),


                                             ),




                                           ],
                                         ),
                                       ),
                                     ),
                                   );
                                 },
                               );


                             }, child: Text("Sort"))



                           ],


                         ),


                       )



                     ],


                   ),
                 ),

               )




          ],

        )




      ),
    );
  }
}
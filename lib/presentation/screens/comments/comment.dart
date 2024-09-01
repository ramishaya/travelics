import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/shared_preffrence.dart';

import '../../../../data/models/comment_model.dart';

class Comments_Pages extends StatefulWidget {
  final String Name;
  const Comments_Pages({super.key, required this.Name});

  @override
  State<Comments_Pages> createState() => _Comments_PagesState();
}

class _Comments_PagesState extends State<Comments_Pages> {
  late Dio dio;
  var firstName;
  var token;
  final TextEditingController addCommentController = TextEditingController();
  final TextEditingController addrateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPref();
    dio = Dio(); // Initialize Dio instance here
  }

  Future<void> addComment({
    String url = "http://192.168.43.183:8080/api/comment",
    required String comment,
    required int rate,
  }) async {
     
    if (token != null && token.isNotEmpty) {
      // Set the Authorization header with the token value
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      Map<String, dynamic> data = {
        "hotel": "Four Seasons Hotel",
        "comment": comment,
        "rate": rate,
      };

      await dio.post(
        url,
        data: {
           "hotel": widget.Name,
        "comment": comment,
        "rate": rate,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch (error) {
      throw Exception('Failed to connect to the API');
    }
  }

  Future<List<CommentModel>> postComment({
    String url = "http://192.168.43.183:8080/api/comment_hotel",
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: {"name": widget.Name},
      );
      List<CommentModel> commentList = [];
      for (var commentData in response.data) {
        commentList.add(CommentModel.fromJson(commentData));
      }
      return commentList;
    } catch (error) {
      throw Exception('Failed to connect to the API');
    }
  }

  Future<void> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = preferences.getString("firstName");
      token = preferences.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: FutureBuilder<List<CommentModel>>(
                future: postComment(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<CommentModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return CommentList(
                          comment: snapshot.data![index].comment!,
                          username: snapshot.data![index].userName!,
                          rate: snapshot.data![index].rate!,
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Container(
            height: 150,
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 2,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: TextFormField(
                        controller: addCommentController,
                        decoration: InputDecoration(
                          hintText: "Write your Comment here",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () async {
                              if (addCommentController.text.isNotEmpty &&
                                  addrateController.text.isNotEmpty) {
                                await addComment(
                                  comment: addCommentController.text,
                                  rate: int.parse(addrateController.text),
                                );
                                setState(() {
                                  addCommentController.clear();
                                  addrateController.clear();
                                });
                                // Refresh the comments list by rebuilding the widget
                              }
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 0,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: TextFormField(
                    controller: addrateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter your rate here",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  final String username;
  final String comment;
  final int rate;

  CommentList(
      {required this.username, required this.comment, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(username),
          ),
          subtitle: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[100],
            child: Text(comment),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            '$rate/5 User Reviews',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

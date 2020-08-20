import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_application/model/news/news_add_new.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/screens/shared.dart';

class AddNewPost extends StatefulWidget {
  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _headingController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  Post _post = Post();

  String heading = '';
  String description = '';
  String category = '';
  File _image;

  var _categoryList = ["Entertainment", "Sport", "Technology", "Politics"];
  var _currentValue;

  final NewsGenerator _newsGenerator = NewsGenerator();

  Future<void> _pickImage(ImageSource source) async {
    // ignore: deprecated_member_use
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = selected;
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Post"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                DropdownButton<String>(
                  hint: Text("Select Category"),
                  items: _categoryList.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      this._currentValue = val;
                    });
                    category = val;
                  },
                  value: _currentValue,
                ),
                TextFormField(
                  controller: _headingController,
                  decoration: textInputDecoration.copyWith(hintText: 'Heading'),
                  validator: (val) => val.isEmpty ? 'Enter Heading' : null,
                  onChanged: (val) {
                    heading = val;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: _descriptionController,
//                    textInputAction: TextInputAction.newline,
//                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Description'),
//                    obscureText: true,
                    validator: (val) =>
                        val.isEmpty ? 'Enter Description' : null,
                    onChanged: (val) {
                      description = val;
                    }),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Add Image'),
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                    Spacer(),
                    if (_image != null) ...[
                      Image.file(
                        _image,
                        width: 100,
                        height: 100,
                      )
                    ]
                  ],
                ),
                RaisedButton(
                  child: Text('Post'),
                  onPressed: () async {
                    print(category);
                    print(heading);
                    print(description);
                    _post.AddPost(_image, heading, description, category);
                    if (_formKey.currentState.validate()) {
                      /*print(heading);
                      print(description);*/
                      try {
                        /*print(category);
                        print(heading);
                        print(description);*/
                        _post.AddPost(_image, heading, description, category);
                      } catch (e) {
                        print(e.toString());
                      }
                      showToast("new post added");
                      _headingController.clear();
                      _descriptionController.clear();
                      _categoryController.clear();
                      setState(() {
                        this._currentValue = null;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

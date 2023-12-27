import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Assignment 3 q1',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  var _name;
  var _email;
  var _rollno;
  var _phoneno;
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _rollnoController=TextEditingController();
  final _phonenoController=TextEditingController();
  

void _showDetails(BuildContext context){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return SecondRoute(name: _nameController.text,email:_emailController.text,rollno:_rollnoController.text,phoneno:_phonenoController.text);
            },
          ),
          ).then((_){
            showDialog(context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Logout'),
                content: Text('User ${_nameController.text} logged out.'),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();},
                    child: Text('OK'),
                    ),
                ],
              );
            });
          });

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Default Page')),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(200,8,200,8),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _rollnoController,
              decoration: InputDecoration(
                hintText: 'Roll no.',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phonenoController,
              decoration: InputDecoration(
                hintText: 'Phone no.',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(240,8,240,8),
              child: Button(context),
            ),
          ],
        ),
      )
    );
  }

  ElevatedButton Button(BuildContext context) {
    return ElevatedButton(
        child: const Text('Show Details'),
        onPressed: () {
          _showDetails(context);
        },
      );
  }
  
}

class SecondRoute extends StatelessWidget {
  SecondRoute({required this.name,required this.email,required this.rollno,required this.phoneno});

  String name;
  var email;
  var rollno;
  var phoneno;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details are as follows:'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(350,8,350,8),
        child: ListView(
          children: [
           
              
              ListTile(
                title: Text('Name: $name'),
              ),
        
            ListTile(
              title: Text('Email: $email'),
            ),
            ListTile(
              title: Text('Roll no.: $rollno'),
            ),
            ListTile(
              title: Text('Phone no.: $phoneno'),
            ),
            
          ],
          
        ),
      ),
    );
  }

  
}
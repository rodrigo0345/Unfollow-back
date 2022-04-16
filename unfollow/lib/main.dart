

import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_border.dart';
import 'package:http/http.dart';


Future getData(url) async {
  Response response = await get(url);
  return response.body;
}

void logic(var username, var pswd)
{
  print("hi " + username + " pass: " + pswd); // debugger
  return;
}
void main() {
  runApp(
    MaterialApp(
    home: HomeScreen(),
    title: 'Unfollow',
    ),
  );
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _Username = TextEditingController();
  TextEditingController _Pswd = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.pink,
                Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 36.0, 
                      horizontal: 24.0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Login", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 46.0,
                            fontWeight: FontWeight.w800,

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Unfollow back", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          TextField(
                            controller: _Username,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 212, 209, 209),
                              hintText: "Username",
                              prefixIcon: Icon(
                                Icons.account_box,
                                color: Color.fromARGB(255, 92, 89, 89),
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20.0, 
                          ),
                          TextField(
                            controller: _Pswd,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 212, 209, 209),
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 92, 89, 89),
                                )
                            ),
                          ),
                          SizedBox(
                            height: 50.0, 
                          ),
                          TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)
                                )
                              ),
                              overlayColor: getColor(Colors.white, Color.fromARGB(255, 242, 58, 107))
                            ),
                            onPressed: ()
                            {
                              logic(_Username.text, _Pswd.text);
                            },
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 242, 58, 107)
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
              ]
            ),
          ),
        )
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
  final getColor = (Set<MaterialState> states){
    if(states.contains(MaterialState.pressed))
    {
      return colorPressed;
    }
    else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
} 


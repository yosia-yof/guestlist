
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newguest extends StatefulWidget {
  const newguest({super.key});

  @override
  State<newguest> createState() => _newguestState();
}

class _newguestState extends State<newguest> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();

  Widget signUpWith(IconData icon) {
    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          TextButton(onPressed: () {}, child: Text('Sign in')),
        ],
      ),
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      margin: EdgeInsets.fromLTRB(4, 10, 4, 0),
      //margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.teal.shade200, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.blue,
                Colors.lightBlue
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                //height: 510,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text("Please Fill the form!"),
                      userInput(fullnameController, 'Jina Kamili', TextInputType.emailAddress),
                      userInput(emailController, 'Email (eg. someone@email.com)', TextInputType.visiblePassword),
                      userInput(phoneController, 'Namba ya Simu (eg. 0711000000)', TextInputType.visiblePassword),
                      userInput(passwordController, 'card ya watu wangapi', TextInputType.visiblePassword),
                      Container(
                        height: 55,
                        // for an exact replicate, remove the padding.
                        // pour une réplique exact, enlever le padding.
                        padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                        child: ElevatedButton(
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          // color: Colors.indigo.shade800,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)
                          ),
                          onPressed: () {
                            print(emailController);
                            print(passwordController);
                            //Provider.of<Auth>(context, listen: false).signup(emailController.text, passwordController.text);
                            //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SuccessfulScreen()));
                          },
                          child: Text('Create Guest', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                        ),
                      ),
                      SizedBox(height: 20),
                      //Center(child: Text('Forgot password ?'),),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // signUpWith(Icons.add),
                            // signUpWith(Icons.book_online),
                          ],
                        ),
                      ),
                      Divider(thickness: 0, color: Colors.white),
                      /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text('Don\'t have an account yet ? ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                        TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      ],
                    ),
                      */
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/components/authentication_button.dart';
import 'package:plant_app/components/custom_text_field.dart';
import 'package:plant_app/constants.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';


class SignupScreen extends StatelessWidget {

  static String id = 'SignupScreen';
   final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  String? ageValidator(String? value) {

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  // constraints: BoxConstraints(
                  //   // maxHeight: MediaQuery.of(context).size.height,
                  // ),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Register',
                            style: GoogleFonts.poppins(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Create a new account',
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 40.0),
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                            CustomTextField(
                              hintText: 'Full Name',
                              icon: Icons.person,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: fullNameController,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Fullname';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Enter Username',
                              icon: Icons.lock,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: usernameController,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Username';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Email',
                              icon: Icons.mail,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: emailController,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter an email address';
                                }
                                bool isValid = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value);
                                if (!isValid) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },

                            ),
                            CustomTextField(
                              hintText: 'Password',
                              icon: Icons.lock,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: passwordController,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a password';
                                }},


                            ),
                            Padding(padding: EdgeInsets.all(30),
                              child: new FlutterPwValidator(
                                controller: passwordController,
                                minLength: 8,
                                uppercaseCharCount: 1,
                                lowercaseCharCount: 1,
                                numericCharCount: 1,
                                specialCharCount: 1,
                                width: 400,
                                height: 150,
                                onSuccess: (){},
                                onFail: (){},
                              ),)
                            ,
                            CustomTextField(
                              hintText: 'Confirm Password',
                              icon: Icons.lock,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: confirmPasswordController,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a password';
                                }
                                if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                            CustomTextField(
                              hintText: 'Enter Age',
                              icon: Icons.lock,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: ageController,
                              validate: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Age is required';
                                }

                                final int? age = int.tryParse(value);

                                if (age == null) {
                                  return 'Enter a valid number';
                                }

                                if (age < 0 || age > 150) {
                                  return 'Age must be between 0 and 150';
                                }

                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Enter Address',
                              icon: Icons.lock,
                              keyboardType: TextInputType.name,
                              controller: addressController,
                              onChanged: (value) {},
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            )
                          ],)
                          ,
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By signing you agree to our ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              Text(
                                ' Terms of use',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'and ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              Text(
                                ' privacy notice',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: AuthenticationButton(
                          label: 'Sign Up',
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            left: 20.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 20.0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: kDarkGreenColor,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

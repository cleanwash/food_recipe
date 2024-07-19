import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/ui/color_styles.dart';
import 'package:food_recipe/ui/text_styles.dart';
import 'package:food_recipe/presentation/component/input_field.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 66),
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyles.largeTextBold,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let's help you set up your account,\nit won't take long.",
                      style: TextStyles.normalTextRegular.copyWith(
                          color: ColorStyles.black,
                          fontSize: TextStyles.smallerTextBold.fontSize),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              InputField(labelText: 'Name', hintText: 'Enter Name'),
              SizedBox(height: 20),
              InputField(labelText: 'Email', hintText: 'Enter Email'),
              SizedBox(height: 20),
              InputField(labelText: 'Password', hintText: 'Enter Password'),
              SizedBox(height: 20),
              InputField(
                  labelText: 'Confirm Password', hintText: 'Retype Password'),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    side: BorderSide(color: Colors.orange, width: 2),
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                  ),
                  Text('Accept terms & Condition',
                      style: TextStyles.normalTextRegular
                          .copyWith(color: ColorStyles.secondary100)),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign Up', style: TextStyles.normalTextBold),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Or Sign in With',
                    style: TextStyles.smallerTextRegular
                        .copyWith(color: ColorStyles.gray1),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/social_icons/google.png'),
                  SizedBox(width: 25),
                  Image.asset('assets/icons/social_icons/facebook.png'),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyles.normalTextRegular
                        .copyWith(color: ColorStyles.black),
                    children: [
                      TextSpan(text: 'Already a member? '),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyles.normalTextRegular
                            .copyWith(color: Colors.orange),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go('/home_screen');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

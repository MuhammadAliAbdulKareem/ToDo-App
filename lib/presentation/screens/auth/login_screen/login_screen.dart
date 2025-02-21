import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/extensions/validations.dart';
import 'package:todo_app/core/utils/route_manager.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/widgets/custom_auth_text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Animation Controllers
  late AnimationController fadeController;
  late AnimationController slideController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    // Fade Animation (Header & Description)
    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );

    // Slide Animation (Fields & Buttons)
    slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: slideController,
      curve: Curves.easeOut,
    ));

    // Start animations
    fadeController.forward();
    slideController.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fadeController.dispose();
    slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade700,
              Colors.blue.shade300,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: 32.0.h, horizontal: 32.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 120.h),
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: Text(
                      'LOGIN',
                      style: LightAppStyle.loginHeader,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: Text(
                      'Welcome Back, Please Login To Your Account',
                      style: GoogleFonts.lato(
                        fontSize: 15.sp,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 32.0.w),
                decoration: const BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: slideAnimation,
                          child: CustomAuthTextForm(
                            keyboardType: TextInputType.emailAddress,
                            textFormFieldHeader: 'User Email',
                            controller: emailController,
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: 'Enter your email',
                            validator: (email) {
                              if (email == null || email.trim().isEmpty) {
                                return 'Email can\'t be empty';
                              }
                              if (!email.isValidEmail()) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SlideTransition(
                          position: slideAnimation,
                          child: CustomAuthTextForm(
                            textFormFieldHeader: 'User Password',
                            controller: passwordController,
                            // keyboardType: TextInputType.visiblePassword,
                            hintText: 'Enter your password',
                            isPassword: true,
                            validator: (password) {
                              if (password == null || password.trim().isEmpty) {
                                return 'Password can\'t be empty';
                              } else if (!password.isValidPassword()) {
                                return 'Password must be 8+ characters long and contain uppercase, lowercase, number, and special character';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 32.h),
                        FadeTransition(
                          opacity: fadeAnimation,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Password Gone Missing? 🕵️‍♂️',
                              style: LightAppStyle.textFormStyle.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SlideTransition(
                          position: slideAnimation,
                          child: SizedBox(
                            width: 250.w,
                            height: 45.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0.r),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                } else {}
                              },
                              child: Text(
                                'LOGIN',
                                style: LightAppStyle.buttonLabel,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SlideTransition(
                          position: slideAnimation,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: LightAppStyle.dropdownMenuLabel.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteManager.register);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: LightAppStyle.textFormStyle.copyWith(
                                    color: Colors.blue,
                                    fontSize: 17.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

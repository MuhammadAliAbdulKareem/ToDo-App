import 'package:flutter/material.dart';
import 'package:todo_app/database_manager/model/todo_data_model.dart';
import 'package:todo_app/presentation/screens/home/home.dart';
import 'package:todo_app/presentation/screens/task_editting_screen/task_editing.dart';
import '../../presentation/screens/auth/login_screen/login_screen.dart';
import '../../presentation/screens/auth/register_screen/register_screen.dart';

class RouteManager {
  static const String home = '/home';
  static const String taskEditing = '/taskEditing';
  static const String login = '/login';
  static const String register = '/register';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case taskEditing:
        TaskDataModel task = settings.arguments as TaskDataModel;
        return MaterialPageRoute(
          builder: (context) => TaskEditing(
            task: task,
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
    }
    return null;
  }
}

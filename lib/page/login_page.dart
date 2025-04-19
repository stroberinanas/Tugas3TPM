import 'package:flutter/material.dart';
import '../page/landing.dart';
import '../util/local_storage.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // Daftar akun yang valid
  final Map<String, String> validUsers = {
    "123220013": "insyuzuu013",
    "123220022": "haqiki022",
    "123220085": "sabila085",
  };

  bool _isObscure = true;
  bool _isError = false;

  void login() async {
    String username = _username.text.trim();
    String password = _password.text;

    if (validUsers.containsKey(username) && validUsers[username] == password) {
      setState(() {
        _isError = false;
      });
      await LocalStorage.login(username);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username atau password salah!")),
      );
      setState(() {
        _isError = true;
      });
    }
  }

  Widget redEye() {
    return InkWell(
      onTap: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
      child: Icon(
        _isObscure
            ? Icons.remove_red_eye_outlined
            : Icons.visibility_off_outlined,
        color: _isError ? Colors.red.shade800 : Colors.grey.shade600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 180, 72, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Center(child: CustomText.h1("Login Page")),
                SizedBox(height: 16),
                CustomTextField.form(_username,
                    label: "Username",
                    isError: _isError,
                    prefixIcon: Icons.person_outline),
                CustomTextField.form(
                  _password,
                  label: "Password",
                  isObscure: _isObscure,
                  isError: _isError,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: redEye(),
                ),
                SizedBox(height: 8),
                CustomButton.primary("Login", login, width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

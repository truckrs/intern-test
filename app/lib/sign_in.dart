import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'theme.dart';
import 'widgets.dart';

class SignIn extends StatefulWidget {
  static String routeName = "/login/signin";

  final bool backPage;

  const SignIn({this.backPage = false, Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loginFailure = false;
  bool _canConnect = false;

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_onControllerChange);
    _passwordController.addListener(_onControllerChange);
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getScrollViewColumnScaffold(context, [
      const SizedBox(height: 74),
      Center(
        child: logo,
      ),
      const SizedBox(height: 74),
      textFieldLabelDark("Identifiant"),
      textFieldDark(_loginController, 'Votre email', autofillHints: [AutofillHints.email]),
      const SizedBox(height: 24),
      textFieldLabelDark("Mot de passe"),
      passwordFieldDark(_passwordController, 'Mot de passe', autofillHints: [AutofillHints.password]),
      Text(
        _loginFailure ? "Identifiant ou mot de passe incorrect" : "",
        style: const TextStyle(color: Colors.red),
      ),
      const SizedBox(height: 24),
      createButton("Connexion", () async {
        setState(() {
          _loginFailure = false;
        });
        try {
          final login = _loginController.text;
          final password = _passwordController.text;
          final uri = Uri.parse("${dotenv.get('BACKEND_BASE_URL')}/authentication/$login/$password");
          final http.Response response = await http.get(uri);
          if (response.statusCode == 401) {
            setState(() {
              _loginFailure = true;
            });
          } else {
            _logged();
          }
        } on Exception catch (e) {
          setState(() {
            _loginFailure = true;
          });
        }
      }, isEnable: _canConnect),
      const SizedBox(height: 104),
    ]);
  }

  _onControllerChange() {
    bool isNotEmpty = _loginController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    if (_canConnect != isNotEmpty) {
      setState(() {
        _canConnect = isNotEmpty;
      });
    }
  }

  _logged() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
}

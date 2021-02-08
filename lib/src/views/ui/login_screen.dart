import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_auth/local_auth.dart';
import 'package:qib_app/src/views/utils/colors.dart';
import 'package:qib_app/src/views/utils/style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final _emailText = TextEditingController();
  bool _validate = false;

  Future<void> builder() async {
    if (await _isBiometricAvailable()) {
      await _getListOfBiometricTypes();
      await _authenticateUser();
    }
  }

  @override
  void initState()  {
    super.initState();
    builder();
  }

  @override
  void dispose() {
    _emailText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New User? Create Account",
              textAlign: TextAlign.center,
              style: textStyle(Colors.black, FontWeight.normal, BodyTextSize),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            _loginIconUI(context),
            _loginFormUI(context),
          ],
        ),
      ),
    );
  }

  /* LOGIN ICON UI */
  Widget _loginIconUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 60.0),
        child: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome!",
                  style: textStyle(parseColor(themePrimaryColor),
                      FontWeight.bold, LargeTextSize),
                  textAlign: TextAlign.start,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Get the best from our app!",
                  style: textStyle(parseColor(themePrimaryColor),
                      FontWeight.normal, MediumTextSize),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* LOGIN FORM UI */
  Widget _loginFormUI(BuildContext context) {
    return Column(
      children: [
        _emailUI(context),
        _passwordUI(context),
        new SizedBox(
          height: 40,
        ),
        _buildLogin(context),
        new SizedBox(
          height: 20,
        ),
        _forgotPasswordUI(context),
      ],
    );
  }

  /* EMAIL UI */
  Widget _emailUI(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 0),
      child: TextField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        controller: _emailText,
        onChanged: (text) {
          setState(
            () {},
          );
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: parseColor(themePrimaryColor),
          ),
          errorText: _validate ? 'Value Can\'t Be Empty' : null,
          border: OutlineBorderStyleBorder,
          enabledBorder: OutlineEnabledBorderStyle,
          focusedBorder: OutlineFocusedBorderStyle,
          labelText: 'Email',
          hintText: 'Enter email',
          filled: true,
        ),
      ),
    );
  }

  /* PASSWORD UI */
  Widget _passwordUI(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: parseColor(themePrimaryColor),
          ),
          errorText: _validate ? 'Value Can\'t Be Empty' : null,
          border: OutlineBorderStyleBorder,
          enabledBorder: OutlineEnabledBorderStyle,
          focusedBorder: OutlineFocusedBorderStyle,
          filled: true,
          labelText: 'Password',
          hintText: 'Enter password',
        ),
      ),
    );
  }

  /* FORGOT PASSWORD UI */
  Widget _forgotPasswordUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 2.0),
      child: Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: textStyle(Colors.black, FontWeight.normal, BodyTextSize),
          ),
        ),
      ),
    );
  }

  Widget _buildLogin(BuildContext context) {
    return Center(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.all(15),
            textColor: Colors.white,
            color: parseColor(themePrimaryColor),
            onPressed: () async {
              navigate(context);
            },
            child: Container(
              child: Text(
                'Login',
                style:
                    textStyle(Colors.white, FontWeight.normal, MediumTextSize),
              ),
            ),
          ),
        ),
      ),
    );
  }

  navigate(BuildContext context) {
    Modular.to.pushNamed('/HomeScreen');
  }

  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    print(listOfBiometrics);
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Please authenticate to view your transaction overview",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if (isAuthenticated) {
      print("Authenticated!");
      navigate(context);
    }
  }
}

navigate(BuildContext context) {
  Modular.to.pushNamed('/HomeScreen');
}

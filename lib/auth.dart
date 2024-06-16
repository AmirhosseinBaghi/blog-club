import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  static const int logintab = 0;
  static const int singuptab = 1;
  int selectedtabIndex = logintab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/img/icons/LOGO.svg',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedtabIndex = logintab;
                            });
                          },
                          child: Text(
                            "login".toUpperCase(),
                            style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500)
                                .apply(
                                    color: selectedtabIndex == logintab
                                        ? Colors.white
                                        : Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedtabIndex = singuptab;
                            });
                          },
                          child: Text(
                            "sing up".toUpperCase(),
                            style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500)
                                .apply(
                                    color: selectedtabIndex == singuptab
                                        ? Colors.white
                                        : Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          color: Colors.white),
                      child:  Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: selectedtabIndex==logintab? const Login():const Singup(),
                        ),
                      ),
                    ))
                  ],
                )),
          ),
        ],
      )),
    );
  }
}

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _focusNodeUsername = FocusNode();

  bool _hasFocusedUsername = false;

  final FocusNode _focusNodePassword = FocusNode();

  bool _hasFocusedPassword = false;

  @override
  void initState() {
    super.initState();
    _focusNodeUsername.addListener(() {
      setState(() {
        _hasFocusedUsername = _focusNodeUsername.hasFocus;
      });
    });
    _focusNodePassword.addListener(() {
      setState(() {
        _hasFocusedPassword = _focusNodePassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeUsername.dispose();
    _focusNodePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Welcome back',
          style: TextStyle(
              fontFamily: 'Avenir', fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text('Sign in with your account'),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: [
            TextField(
              onTap: () {},
              cursorColor: Colors.blue,
              focusNode: _focusNodeUsername,
              decoration: InputDecoration(
                  focusColor: Colors.blue,
                  label: Text(
                    'username',
                    style: TextStyle(
                        color: _hasFocusedUsername ? Colors.blue : Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(16)),
                  suffixIcon: const Icon(
                    CupertinoIcons.mail_solid,
                  ),
                  suffixIconColor:
                      _hasFocusedUsername ? Colors.blue : Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            PasswordTextFild(
                focusNodePassword: _focusNodePassword,
                hasFocosedPassword: _hasFocusedPassword),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 60))),
                child: Text(
                  'login'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Forgot your Password?'),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Reset here',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            SizedBox(
              width: 200,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/img/icons/Google.png',
                        width: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/img/icons/Twitter.png',
                          width: 40)),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/img/icons/Facebook.png',
                          width: 40)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class Singup extends StatefulWidget {
  const Singup({
    super.key,
  });

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  final FocusNode _focusNodeUsername = FocusNode();

  bool _hasFocusedUsername = false;

  final FocusNode _focusNodePassword = FocusNode();

  bool _hasFocusedPassword = false;

  final FocusNode _focusNodeFullName = FocusNode();

  bool _hasFocusedNodeFullName = false;

  @override
  void initState() {
    super.initState();
    _focusNodeUsername.addListener(() {
      setState(() {
        _hasFocusedUsername = _focusNodeUsername.hasFocus;
      });
    });
    _focusNodePassword.addListener(() {
      setState(() {
        _hasFocusedPassword = _focusNodePassword.hasFocus;
      });
    });
    _focusNodeFullName.addListener(() {
      setState(() {
        _hasFocusedNodeFullName = _focusNodeFullName.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeUsername.dispose();
    _focusNodePassword.dispose();
    _focusNodeFullName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Welcome to blog Club',
          style: TextStyle(
              fontFamily: 'Avenir', fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text('please enter your information'),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: [
            // TextField(
            //   cursorColor: Colors.blue,
            //   focusNode: _focusNodeFullName,
            //   decoration: InputDecoration(
            //       focusColor: Colors.blue,
            //       label: Text(
            //         'Full Name',
            //         style: TextStyle(
            //             color: _hasFocusedNodeFullName
            //                 ? Colors.blue
            //                 : Colors.grey),
            //       ),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(16),
            //           borderSide: const BorderSide(color: Colors.grey)),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: const BorderSide(color: Colors.blue),
            //           borderRadius: BorderRadius.circular(16)),
            //       suffixIcon: const Icon(
            //         CupertinoIcons.person_alt,
            //       ),
            //       suffixIconColor:
            //           _hasFocusedNodeFullName ? Colors.blue : Colors.grey),
            // ),
            TextField(
              onTap: () {},
              cursorColor: Colors.blue,
              focusNode: _focusNodeFullName,
              decoration: InputDecoration(
                  focusColor: Colors.blue,
                  label: Text(
                    'Full Name',
                    style: TextStyle(
                        color: _hasFocusedNodeFullName ? Colors.blue : Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(16)),
                  suffixIcon: const Icon(
                    CupertinoIcons.person_alt,
                  ),
                  suffixIconColor:
                      _hasFocusedNodeFullName ? Colors.blue : Colors.grey),
            ),
            const SizedBox(height: 20,),
            TextField(
              onTap: () {},
              cursorColor: Colors.blue,
              focusNode: _focusNodeUsername,
              decoration: InputDecoration(
                  focusColor: Colors.blue,
                  label: Text(
                    'username',
                    style: TextStyle(
                        color: _hasFocusedUsername ? Colors.blue : Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(16)),
                  suffixIcon: const Icon(
                    CupertinoIcons.mail_solid,
                  ),
                  suffixIconColor:
                      _hasFocusedUsername ? Colors.blue : Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            PasswordTextFild(
                focusNodePassword: _focusNodePassword,
                hasFocosedPassword: _hasFocusedPassword),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 60))),
                child: Text(
                  'sign up'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'or sing up with'.toUpperCase(),
              style: const TextStyle(letterSpacing: 2),
            )),
            SizedBox(
              width: 200,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/img/icons/Google.png',
                        width: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/img/icons/Twitter.png',
                          width: 40)),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/img/icons/Facebook.png',
                          width: 40)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}


class PasswordTextFild extends StatefulWidget {
  const PasswordTextFild({
    super.key,
    required FocusNode focusNodePassword,
    required bool hasFocosedPassword,
  })  : _focusNodePassword = focusNodePassword,
        _hasFocosedPassword = hasFocosedPassword;

  final FocusNode _focusNodePassword;
  final bool _hasFocosedPassword;

  @override
  State<PasswordTextFild> createState() => _PasswordTextFildState();
}

class _PasswordTextFildState extends State<PasswordTextFild> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      obscureText: obscureText,
      cursorColor: Colors.blue,
      focusNode: widget._focusNodePassword,
      decoration: InputDecoration(
          focusColor: Colors.blue,
          label: Text(
            'Password',
            style: TextStyle(
                color: widget._hasFocosedPassword ? Colors.blue : Colors.grey),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(16)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: obscureText
                  ? const Icon(CupertinoIcons.eye_fill)
                  : const Icon(CupertinoIcons.eye_slash_fill)),
          suffixIconColor:
              widget._hasFocosedPassword ? Colors.blue : Colors.grey),
    );
  }
}

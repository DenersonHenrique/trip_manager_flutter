import 'package:flutter/material.dart';

import '../../../../commons/helpers/errors/auth_exception.dart';
import '../../domain/entities/login_params_entity.dart';

enum AuthMode { signUp, login }

class AuthFormWidget extends StatefulWidget {
  final bool isLoading;
  final Function(LoginParamsEntity, String) onSubmit;

  const AuthFormWidget({
    super.key,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget>
    with TickerProviderStateMixin {
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  AuthMode authMode = AuthMode.login;

  final GlobalKey<FormState> _form = GlobalKey();
  final _passwordController = TextEditingController();

  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;
  AnimationController? _animationController;

  bool _isLogin() => authMode == AuthMode.login;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _animationController!,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _animationController!,
      ),
    );
  }

  void _switchAuthMode() {
    if (_isLogin()) {
      setState(() => authMode = AuthMode.signUp);
      _animationController?.forward();
    } else {
      setState(() => authMode = AuthMode.login);
      _animationController?.reverse();
    }
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState?.save();

    LoginParamsEntity loginParams = LoginParamsEntity(
      email: _authData["email"],
      password: _authData["password"],
    );

    try {
      if (_isLogin()) {
        await widget.onSubmit(loginParams, 'signInWithPassword');
      } else {
        await widget.onSubmit(loginParams, 'signUp');
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Erro inesperado');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Erro!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Fechar',
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 62),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: <Widget>[
          Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0xFF3127F3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Informe um e-mail válido.';
                        }
                        return null;
                      },
                      onSaved: (email) => _authData['email'] = email ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0xFF3127F3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Senha',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Informe uma senha válida.';
                        }
                        return null;
                      },
                      onSaved: (password) =>
                          _authData['password'] = password ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _isLogin() ? 0 : 10.0,
                      maxHeight: _isLogin() ? 0 : 45.0,
                    ),
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0xFF3127F3),
                        ),
                      ],
                    ),
                    child: FadeTransition(
                      opacity: _opacityAnimation!,
                      child: SlideTransition(
                        position: _slideAnimation!,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Confirmar Senha',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: _isLogin()
                              ? null
                              : (value) {
                                  if (value != _passwordController.text) {
                                    return 'Senhas diferentes.';
                                  }
                                  return null;
                                },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const Align(
          //   alignment: Alignment.centerRight,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 16, right: 32),
          //     child: Text(
          //       'Forgot Password ?',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //   ),
          // ),
          const Spacer(),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF3127F3),
                  Color(0xFF5E51D0),
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: Colors.transparent,
              ),
              child: Center(
                child: widget.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        _isLogin()
                            ? 'Login'.toUpperCase()
                            : 'Registrar'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Não tem uma conta?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: _switchAuthMode,
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

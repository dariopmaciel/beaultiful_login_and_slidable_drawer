import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
//------>
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//definição das variaveis detriger do icone de check error
  late SMIBool check;
  late SMIBool reset;
  late SMIBool error;
//controlador dos estados do componente
  StateMachineController getRiveControler(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State MAchine 1");

    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
//------>
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
//------> Validador de campo preenchido
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset('assets/icons/email.svg'),
                    ),
                  ),
                ),
              ),
              const Text(
                "Senha",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
//------> Validador de campo preenchido
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  // keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey().currentState!.validate()) {
                      //Se tudo estiver bem OK
                    } else {
                      //Se não estiver

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff77d8e),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xfffe0037),
                  ),
                  label: const Text("OK"),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: RiveAnimation.asset("assets/RiveAssets/check_error.riv"),
        ),
      ],
    );
  }
}

//"assets/RiveAssets/check_error.riv"

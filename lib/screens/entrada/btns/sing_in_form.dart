import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
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
  bool isShowLoading = false;

//definição das variaveis detriger do icone de check error
  late SMITrigger check;
  late SMITrigger reset;
  late SMITrigger error;

  late SMITrigger confetti;

//controlador dos estados do gatilho, "componente"
  StateMachineController getRiveControler(Artboard artboard) {
    StateMachineController? controller = StateMachineController.fromArtboard(
        artboard, "State MAchine 1"); //nome dado pelo criador no Rive

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
                    setState(() {
                      isShowLoading = true;
                    });
                    Future.delayed(Duration(seconds: 1), () {
                      if (_formKey.currentState!.validate()) {
                        //Se tudo estiver bem
                        check.fire();
                        Future.delayed(
                          Duration(seconds: 2),
                          () {
                            setState(() {
                              isShowLoading = false;
                            });
                            confetti.fire();
                          },
                        );
                      } else {
                        //Se não estiver
                        error.fire();
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isShowLoading = false;
                          });
                        });
                      }
                    });
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
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                "assets/RiveAssets/check_error.riv",
                onInit: (artboard) {
                  StateMachineController controller =
                      getRiveControler(artboard);
                  check = controller.findSMI("Check") as SMITrigger;
                  reset = controller.findSMI("Reset") as SMITrigger;
                  error = controller.findSMI("Error") as SMITrigger;
                },
              ))
            : const SizedBox(),
        CustomPositioned(
          child: RiveAnimation.asset(
            "assets/RiveAssets/confetti.riv",
            onInit: (artboard) {
              StateMachineController controller = getRiveControler(artboard);
              confetti = controller.findSMI("Trigger explosion") as SMITrigger;
            },
          ),
        ),
      ],
    );
  }
}

//"assets/RiveAssets/check_error.riv"
class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: child,
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/routes/routes.dart';
import 'package:restro/src/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _mobileFocus = FocusNode();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.dismissKeyboard();
      context.push(RoutesName.otp);
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //         content:
    //         Text('Please correct your mobile number.')),
    //   );
    // }
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate?.biryaniMahal ?? "Biryani Mahal",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "${translate?.login ?? "Login"} / ${translate?.signUp ?? "Sign UP"}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      translate?.enterMobileNumberForOtp ??
                          "Enter mobile number for OTP",
                      style:
                          const TextStyle(fontSize: 14, color: AppColors.grey),
                    ),
                    const SizedBox(height: 20),
                    AppTextFormField(
                      controller: _mobileController,
                      ownFocus: _mobileFocus,
                      labelText: translate?.mobileNumber ?? 'Mobile Number',
                      hintText: translate?.enterYourMobileNumber ??
                          'Enter your mobile number',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone,
                      maxLength: 10,
                      onChanged: (value) {
                        print("Input: $value");
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return translate?.mobileNumberIsRequired ??
                              'Mobile number is required';
                        }
                        if (value.length != 10) {
                          return translate?.mobileNumberMustBeTenDigits ??
                              'Mobile number must be 10 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 60),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            text: translate?.signIn ?? "Sign In",
                            onPressed: _submit,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

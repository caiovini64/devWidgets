import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  State<FormExample> createState() => _FormExampleState();
}

final formKey = GlobalKey<FormState>();

final nameController = TextEditingController();
final rgController = TextEditingController();
final cpfController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

String? selectedCity;
String? selectedGender;
List<String>? selectedTags = [];

bool isObscurePass = true;
bool isObscureConfirmPass = true;

class _FormExampleState extends State<FormExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DMNameField(
                labelText: 'Nome e Sobrenome',
                emptyErrorText: 'empty',
                invalidNameErrorText: 'invalidName',
                controller: nameController,
              ),
              const DMHorizontalBox.medium(),
              DMRgField(
                  labelText: 'RG',
                  emptyErrorText: 'empty',
                  invalidRGErrorText: 'invalidRG',
                  controller: rgController),
              const DMHorizontalBox.medium(),
              DMCpfField(
                labelText: 'CPF',
                emptyErrorText: 'empty',
                invalidCPFErrorText: 'invalidCPF',
                controller: cpfController,
              ),
              const DMHorizontalBox.medium(),
              DMEmailField(
                  labelText: 'Email',
                  emptyErrorText: 'empty',
                  invalidEmailerrorText: 'invalidEmail',
                  controller: emailController),
              const DMHorizontalBox.medium(),
              Align(
                alignment: Alignment.centerRight,
                child: DMCityField(
                  list: const ['Aracaju', 'Itabaiana', 'Socorro'],
                  title: 'Cidades',
                  onChanged: (value) {
                    selectedCity = value;
                    setState(() {});
                  },
                ),
              ),
              const DMHorizontalBox.medium(),
              DMPasswordField(
                labelText: 'Password',
                emptyErrorText: 'empty',
                invalidPasswordErrorText: 'invalidPassword',
                controller: passwordController,
                suffixIcon:
                    isObscurePass ? Icons.visibility_off : Icons.visibility,
                obscureText: isObscurePass,
                onSuffixIconTap: () {
                  isObscurePass = !isObscurePass;
                  setState(() {});
                },
              ),
              const DMHorizontalBox.medium(),
              DMConfirmPasswordField(
                labelText: 'Confirm Password',
                emptyErrorText: 'empty',
                invalidPasswordErrorText: 'invalidPassword',
                controller: confirmPasswordController,
                passwordController: passwordController,
                suffixIcon: isObscureConfirmPass
                    ? Icons.visibility_off
                    : Icons.visibility,
                obscureText: isObscureConfirmPass,
                onSuffixIconTap: () {
                  isObscureConfirmPass = !isObscureConfirmPass;
                  setState(() {});
                },
              ),
              const DMHorizontalBox.medium(),
              DMGenderField(
                  title: 'Genders',
                  maleTitle: 'Male',
                  femaleTitle: 'Female',
                  onChanged: (value) {
                    selectedGender = value;
                    setState(() {});
                  }),
              const DMHorizontalBox.medium(),
              DMChipField(
                title: 'Tags',
                items: const ['a', 'b', 'c'],
                selectedItems: const [],
                onChanged: (value) {
                  selectedTags = value;
                  setState(() {});
                },
              ),
              const DMHorizontalBox.medium(),
              Center(
                child: DMSubmitButton(
                  text: 'Submit',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print(nameController.value.text);
                      print(rgController.value.text);
                      print(cpfController.value.text);
                      print(emailController.value.text);
                      print(passwordController.value.text);
                      print(confirmPasswordController.value.text);
                      print(selectedGender);
                      print(selectedCity);
                      print(selectedTags);
                    }
                  },
                ),
              ),
              const DMHorizontalBox.medium(),
            ],
          ),
        ),
      ),
    );
  }
}

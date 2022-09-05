import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  @override
  Widget build(BuildContext context) {
    final nameKey = GlobalKey<FormState>();
    final rgKey = GlobalKey<FormState>();
    final cpfKey = GlobalKey<FormState>();
    final emailKey = GlobalKey<FormState>();
    final passwordKey = GlobalKey<FormState>();
    final confirmPasswordKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    String? selectedCity;
    String? selectedGender;
    List<String>? selectedTags = [];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DMNameField(
              formKey: nameKey,
              labelText: 'Nome e Sobrenome',
              emptyErrorText: 'empty',
              invalidNameErrorText: 'invalidName',
              controller: TextEditingController(),
            ),
            const DMHorizontalBox.medium(),
            DMRgField(
              formKey: rgKey,
              labelText: 'RG',
              emptyErrorText: 'empty',
              invalidRGErrorText: 'invalidRG',
              controller: TextEditingController(),
            ),
            const DMHorizontalBox.medium(),
            DMCpfField(
              formKey: cpfKey,
              labelText: 'CPF',
              emptyErrorText: 'empty',
              invalidCPFErrorText: 'invalidCPF',
              controller: TextEditingController(),
            ),
            const DMHorizontalBox.medium(),
            DMEmailField(
              formKey: emailKey,
              labelText: 'Email',
              emptyErrorText: 'empty',
              invalidEmailerrorText: 'invalidEmail',
              controller: TextEditingController(),
            ),
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
              formKey: passwordKey,
            ),
            const DMHorizontalBox.medium(),
            DMConfirmPasswordField(
              labelText: 'Confirm Password',
              emptyErrorText: 'empty',
              invalidPasswordErrorText: 'invalidPassword',
              controller: TextEditingController(),
              passwordController: passwordController,
              formKey: confirmPasswordKey,
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
          ],
        ),
      ),
    );
  }
}

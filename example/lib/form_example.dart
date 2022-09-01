import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

class FormExample extends StatelessWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameKey = GlobalKey<FormState>();
    final rgKey = GlobalKey<FormState>();
    final cpfKey = GlobalKey<FormState>();
    final emailKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}

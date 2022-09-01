import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  static const _spacing = 8.0;
  bool isDarkMode = false;
  final nameKey = GlobalKey<FormState>();
  final rgKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Design System",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Submit Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DMSubmitButton(
                        text: 'Label',
                        onTap: () {},
                      ),
                      DMNameField(
                        formKey: nameKey,
                        labelText: 'name',
                        emptyErrorText: 'empty',
                        invalidNameErrorText: 'invalidName',
                        controller: TextEditingController(),
                      ),
                      DMRGField(
                        formKey: rgKey,
                        labelText: 'RG',
                        emptyErrorText: 'empty',
                        invalidRGErrorText: 'invalidRG',
                        controller: TextEditingController(),
                      ),
                      DMSubmitButton(
                        text: 'Label',
                        isLoading: true,
                        onTap: () {},
                      ),
                      const DMSubmitButton(
                        text: 'Label',
                      ),
                      DMSubmitButton(
                        text: 'Label',
                        isOutlined: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Text Fields",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const SizedBox(
                        width: 300,
                        child: DMTextField(
                          labelText: "Label",
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: DMTextField(
                          labelText: "Label",
                          initialValue: "email@eee.com",
                          onSuffixIconTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: DMTextField(
                          labelText: "Label",
                          obscureText: true,
                          suffixIcon: Icons.visibility_off,
                          onSuffixIconTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: DMTextField(
                          labelText: "Label",
                          initialValue: "password",
                          obscureText: true,
                          suffixIcon: Icons.visibility_off,
                          onSuffixIconTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Rounded Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      DMRoundedButton.icon(
                        icon: Icons.arrow_forward_ios,
                      ),
                      DMRoundedButton.icon(
                        icon: Icons.arrow_forward_ios,
                        enabled: false,
                      ),
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Submit Action Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      DMSubmitActionButton(
                        text: 'Label',
                        color: Colors.blue,
                      ),
                      DMSubmitActionButton(
                        text: 'Label',
                        color: Colors.blue,
                      ),
                      DMSubmitActionButton.dangerous(text: 'Label'),
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Outlined Action Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DMOutlinedActionButton(
                        text: 'Label',
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Border Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DMBorderButton(
                        text: 'Label',
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Switch Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DMSwitchButton(value: true, onChanged: (_) {}),
                      DMSwitchButton(value: false, onChanged: (_) {}),
                    ],
                  ),
                ),
                const DMHorizontalBox.medium(),
                GroupOf(
                  title: "Text Button",
                  child: Wrap(
                    runSpacing: _spacing,
                    spacing: _spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DMTextButton(text: 'Label', onTap: () {}),
                      DMTextButton(
                        text: 'Label',
                        onTap: () {},
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

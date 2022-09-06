# MagicWidgets

This library includes the commom widgets of the devmagic [design system](https://www.figma.com/file/IDSTh0MfYXfTJfC6pt1BSa/DMWidgets?node-id=0%3A1).


## 💻 Installing

```yaml
dependencies:
  devmagic_widgets:
```

## 🎮 Usage

### Buttons

```dart
DMRoundedButton(
    onTap: () {},
    child: const Icon(Icons.wallet_giftcard),
),
```
```dart
DMBorderButtonWidget(onTap: () {}, text: 'text'),
```
### Constants

The constants has been defined using the concept of 8 point frid system.

```dart
  double small = 4.0;
  double semiSmall = 8.0;
  double medium = 16.0;
  double semiLarge = 24.0;
  double large = 32.0;
  double extraLarge = 64.0;
```

```dart
 height: DMPaddingConstants.medium,
```

### Spacers

`SizedBox` has been replaced by DMVerticalBox or DMHorizontalBox with default sizes defined in DMPaddingConstants:   


```dart
const DMVerticalBox.small(),
const DMVerticalBox.medium(),
const DMHorizontalBox.medium(),
const DMHorizontalBox.small(),
```

### SnackBars
Snackbar has been made easy to call it just:

```dart
onTap: () => showFloatSnackBar(context, 'content'),
```

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.dev/).

For help on editing package code, view the [documentation](https://flutter.dev/developing-packages/).
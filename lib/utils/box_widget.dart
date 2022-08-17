import 'package:flutter/material.dart';

import 'package:devmagic_widgets/devmagic_widgets.dart';

class DMVerticalBox extends SizedBox {
  const DMVerticalBox.small({Key? key})
      : super(height: DMPaddingConstants.small, key: key);
  const DMVerticalBox.semiSmall({Key? key})
      : super(height: DMPaddingConstants.semiSmall, key: key);
  const DMVerticalBox.medium({Key? key})
      : super(height: DMPaddingConstants.medium, key: key);
  const DMVerticalBox.semiLarge({Key? key})
      : super(height: DMPaddingConstants.semiLarge, key: key);
  const DMVerticalBox.large({Key? key})
      : super(height: DMPaddingConstants.large, key: key);
  const DMVerticalBox.extraLarge({Key? key})
      : super(height: DMPaddingConstants.extraLarge, key: key);
}

class DMHorizontalBox extends SizedBox {
  const DMHorizontalBox.small({Key? key})
      : super(height: DMPaddingConstants.small, key: key);
  const DMHorizontalBox.semiSmall({Key? key})
      : super(height: DMPaddingConstants.semiSmall, key: key);
  const DMHorizontalBox.medium({Key? key})
      : super(height: DMPaddingConstants.medium, key: key);
  const DMHorizontalBox.semiLarge({Key? key})
      : super(height: DMPaddingConstants.semiLarge, key: key);
  const DMHorizontalBox.large({Key? key})
      : super(height: DMPaddingConstants.large, key: key);
  const DMHorizontalBox.extraLarge({Key? key})
      : super(height: DMPaddingConstants.extraLarge, key: key);
}

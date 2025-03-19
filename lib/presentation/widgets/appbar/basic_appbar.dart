import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const BasicAppbar({super.key, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          showBackButton
              ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

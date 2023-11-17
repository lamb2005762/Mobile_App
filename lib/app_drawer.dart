import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_manager.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: const Text('Xin Chào!'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(IconlyLight.home),
          title: const Text('Trang chủ'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(IconlyLight.category),
          title: const Text('Danh mục'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/categories');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart_sharp),
          title: const Text('Giỏ hàng'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/cart');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Đăng xuất'),
          onTap: () {
            Navigator.of(context)
              ..pop()
              ..pushReplacementNamed('/');
            context.read<AuthManager>().logout();
          },
        )
      ]),
    );
  }
}

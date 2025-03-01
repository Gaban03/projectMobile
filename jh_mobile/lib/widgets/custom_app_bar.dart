part of '_widgets_lib.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onNotificationPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onMenuPressed,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
              size: 40,
            ),
            onPressed: onMenuPressed,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 28,
            ),
            onPressed: onNotificationPressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
part of "_widgets_lib.dart";

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  @override
  final Size preferredSize;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.preferredSize = const Size.fromHeight(60),
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 66, 66),
            Color.fromARGB(255, 255, 0, 0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: widget.preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            iconSize: 40,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

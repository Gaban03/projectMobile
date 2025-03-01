part of '_widgets_lib.dart';

class HomeMenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? warning;
  final IconData? icon;
  final Function()? onPressed;

  const HomeMenuItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.warning,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 3,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.red,
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xff292E33),
                        ),
                        children: warning == null
                            ? []
                            : [
                                const TextSpan(text: " "),
                                const WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    Icons.warning_amber,
                                    size: 14,
                                    color: Colors.amber,
                                  ),
                                ),
                                TextSpan(
                                  text: "$warning",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.orange.withOpacity(0.7),
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.grey[400],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 30,
              color: Colors.grey[400],
            )
          ],
        ),
      ),
    );
  }
}
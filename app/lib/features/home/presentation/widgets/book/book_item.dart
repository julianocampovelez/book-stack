import 'package:app/features/home/domain/entities/entities.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  // Displays book image, title, and subtitle
  final Book book;

  // Callback when a book is selected
  final Function onBookSelected;

  const BookItem({super.key, required this.book, required this.onBookSelected});

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyles = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onBookSelected(context, book),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: DsNetworkImage(url: book.image),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: textStyles.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (book.subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        book.subtitle,
                        style: textStyles.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

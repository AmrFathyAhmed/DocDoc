
import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';
import '../../data/datasource/faq_items_list.dart';
import '../widgets/settings/faq_item.dart';
import 'package:flutter/material.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "FAQ",

      ),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 10),
        child: ListView(
          children: [
            Column(
              children: List.generate(
                faqItemsList.length,
                (index) {
                  var item = faqItemsList[index];
                  return FAQItem(
                    item: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

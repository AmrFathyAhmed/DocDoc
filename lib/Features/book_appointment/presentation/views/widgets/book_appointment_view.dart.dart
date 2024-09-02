import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/payment_page.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/step_indicator.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/summary_page.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../doctor_details/presentation/views/doctor_details_view.dart';
import '../../../../home/presentation/views/widgets/notifaction_app_bar.dart';
import 'date_time_page.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  DateTime? selectedDateTime;
  String? note;
  String? paymentMethod;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Book Appointment"),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 24, vertical: 16),
        child: Column(
          children: [
            StepIndicator(currentStep: _currentIndex),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: [
                  DateAndTimePage(
                    onDateTimeConfirm: (value) {
                      setState(() {
                        selectedDateTime = value;
                      });
                    },
                    onNoteChanged: (value) {
                      setState(() {
                        note = value;
                      });
                    },
                  ),
                  PaymentPage(
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    },
                  ),
                  SummaryPage(
                    selectedDateTime: selectedDateTime,
                    note: note,
                    image: Assets.imagesDoctor1,
                    rating: "4.8",
                    paymentMethod: paymentMethod,
                  ),
                ],
              ),
            ),
            MakeAnAppointmentBtn(
              text: _currentIndex < 2 ? 'Continue' : 'Book Now',
              onPressed: () {
                if (_currentIndex < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

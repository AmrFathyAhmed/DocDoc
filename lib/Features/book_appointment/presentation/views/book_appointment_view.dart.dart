
import 'package:dio/dio.dart';
import 'package:doc_doc/Features/book_appointment/presentation/manger/book_cubit.dart';
import 'package:doc_doc/Features/book_appointment/presentation/manger/book_state.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/booking_details_view.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/date_time_page.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/payment_page.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/step_indicator.dart';
import 'package:doc_doc/Features/book_appointment/presentation/views/widgets/summary_page.dart';
import 'package:doc_doc/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/api_helper/end_points.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../doctor_details/presentation/views/doctor_details_view.dart';
import '../../../home/data/models/doctor_model.dart';
import '../../../home/presentation/views/widgets/notifaction_app_bar.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key, required this.doctor, required this.images});
  final Doctor doctor;
  final String images;
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

    return
      BlocProvider(
        create: (context) => BookCubit(),
        child: BlocConsumer<BookCubit,BookState>(
          listener: (context, state) {
      if (state is BookSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Appointment booked successfully'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookingDetailsView(images: widget.images,doctor: widget.doctor,note: note??"",selectedDateTime: selectedDateTime ,),));
      } else if (state is BookFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage.toString()),
            backgroundColor: AppColors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }, builder: (BuildContext context, BookState state) {
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
                          doctor: widget.doctor,
                          images: widget.images,
                          selectedDateTime: selectedDateTime,
                          note: note,

                          image: Assets.imagesDoctor1,
                          rating: "4.8",
                          paymentMethod: paymentMethod,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar:state is BookLoading
            ? const Center(
          child: CircularProgressIndicator(
          color: AppColors.primary,
          ),
          )

            :MakeAnAppointmentBtn(
              text: _currentIndex < 2 ? 'Continue' : 'Book Now',
              onPressed: () async {
                if (_currentIndex < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(
                      selectedDateTime ?? DateTime.now());
                  BlocProvider.of<BookCubit>(context).Book(doctorId: widget.doctor.id, startDate: formattedDate, note: note??"");
                }
              },
            ),
          );

        }),
      );
  }
}

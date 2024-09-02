import '../../Features/home/data/models/notification_item_model.dart';
import '../../generated/assets.dart';
import '../theming/colors.dart';

List<NotificationItemModel> notificationItemModelList = [
  NotificationItemModel(
    image: Assets.svgsAppointmentSuccess,
    title: "Appointment Success",
    subTitle:
    "Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.",
    backgroundImageColor: AppColors.appointmentSuccess,
    isRead: true,
    time: '1h',
  ),
  NotificationItemModel(
    image: Assets.svgsScheduleChanged,
    title: "Schedule Changed",
    subTitle:
    "You have successfully changed your appointment with Dr. Randy Wigham. Don’t forget to active your reminder.",
    backgroundImageColor: AppColors.scheduleChanged,
    isRead: false,
    time: '5h',
  ),
  NotificationItemModel(
    image: Assets.svgsVideoCallAppointment,
    title: "Video Call Appointment",
    subTitle:
    "We'll send you a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
    backgroundImageColor: AppColors.videoCallAppointment,
    isRead: true,
    time: '7h',
  ),
  NotificationItemModel(
    image: Assets.svgsAppointmentCancelled,
    title: "Appointment Cancelled",
    subTitle:
    "We'll send you a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
    backgroundImageColor: AppColors.appointmentCancelled,
    isRead: true,
    time: '1d',
  ),
  NotificationItemModel(
    image: Assets.svgsNewPaymentAdded,
    title: "New Payment Added!",
    subTitle: "Your payment has been successfully linked with Docdoc.",
    backgroundImageColor: AppColors.newPaymentAdded,
    isRead: false,
    time: '1d',
  ),
  NotificationItemModel(
    image: Assets.svgsAppointmentSuccess,
    title: "Appointment Success",
    subTitle:
    "Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.",
    backgroundImageColor: AppColors.appointmentSuccess,
    isRead: true,
    time: '2d',
  ),
  NotificationItemModel(
    image: Assets.svgsVideoCallAppointment,
    title: "Video Call Appointment",
    subTitle:
    "We'll send you a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
    backgroundImageColor: AppColors.videoCallAppointment,
    isRead: true,
    time: '2d',
  ),
];

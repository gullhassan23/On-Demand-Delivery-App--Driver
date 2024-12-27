import 'package:driverapp/binding/dashboard_binding.dart';
import 'package:driverapp/binding/job_binding.dart';
import 'package:driverapp/screens/Splash/SplashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../main_screen.dart';
import '../screens/Dashboard/dashboard.dart';
import '../screens/MyJobs/MyJobs.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splashscreen;
  static const splashscreen = Routes.splashscreen;
  static const JobScreen = Routes.JobScreen;

  // static const HomeScreen = Routes.HomeScreen;

  static const Mainscreen = Routes.MainScreen;


  static final routes = [
    GetPage(
      name: _Paths.HomeScreen,
      page: () =>  HomeScreen(),
      binding: DashboardBinding(),
    ),
     GetPage(
      name: _Paths.MainScreen,
      page: () =>  MainScreen(),
      // binding: DashboardBinding(),
    ),
     GetPage(
      name: _Paths.Splash,
      page: () =>  SplashScreen(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.JobScreen,
      page: () =>  MyJobs(),
      binding: JobBinding(),
    ),
    // GetPage(
    //   name: _Paths.SignIn,
    //   page: () => const SignInScreen(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SignUp,
    //   page: () => const SignUpScreen(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ForgetPassword,
    //   page: () => const ForgetPassword(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EmailScreen,
    //   page: () => const EmailScreen(),
    //   binding: ForgetBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DefaultScreen,
    //   page: () => const DefaultScreen(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ReportInjury,
    //   page: () => const ReportInjury(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ReportEmployee,
    //   page: () => ReportInjuryForEmployeeAndEmployer(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.Dashboard,
    //   page: () => const DashboardScreen(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.UserDashboard,
    //   page: () => const UserDashboard(),
    // ),
    // GetPage(
    //   name: _Paths.PessiDashboard,
    //   page: () => const PessiDashboard(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EmployerDashboard,
    //   page: () => const EmployerDashboard(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.Notification,
    //   page: () => const NotificationScreen(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ReportedCases,
    //   page: () => const ReportedCases(),
    //   binding: reportedCasesBinding(),
    // ),
    // GetPage(
    //   name: _Paths.UserManagement,
    //   page: () => const UserManagement(),
    //   binding: UserManagmentControllerBinding(),
    // ),
    // GetPage(
    //   name: _Paths.AboutProject,
    //   page: () => const AboutProject(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.UpdateProfile,
    //   page: () => const UpdateProfile(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.reportNearMiss,
    //   page: () => const ReportNearMiss(),
    //   // binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NearMiss,
    //   page: () => const NearMissScreen(),
    //   binding: NearMissBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DashboardReport,
    //   page: () => const DashboardReport(),
    //   binding: DashboardReportBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EditReport,
    //   page: () => const EditReportInjury(),
    //   binding: EditReportBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EditReportEmployer,
    //   page: () => EditReportInjuryForEmployeeAndEmployer(),
    //   binding: EditReportBinding(),
    // ),
  ];
}

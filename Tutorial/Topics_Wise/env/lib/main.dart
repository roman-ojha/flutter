import 'package:flutter/material.dart';

// importing custom widget
// import "Class_00_Other_Topics/02_Builder/03_FutureBuilder/03_FutureBuilder.dart";
// import 'Class_01_Text_Widget/Text/TextWidget.dart';
// import 'Class_01_Text_Widget/02_Rich_Text/02_Rich_Text.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/01_Container_Class/ContainerWidget.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/02_Align_Class/AlignClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/03_Center_Class/CenterClass.dart';
// import 'Class_02_Layout_Widget/Multi_Child_Layout_Widget/01_Column_Class/ColumnClass.dart';
// import 'Class_02_Layout_Widget/Multi_Child_Layout_Widget/02_Row_Class/RowClass.dart';
// import 'Class_02_Layout_Widget/Multi_Child_Layout_Widget/03_Stack_Class/StackClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/04_AspectRatio_Class/AspectRatioClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/05_Baseline_Class/BaseLineClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/06_Expanded_Class/ExpandedClass.dart';
// import 'Class_02_Layout_Widget/Multi_Child_Layout_Widget/04_ListView_Class/ListViewClassVertical.dart';
// import 'Class_03_Assets_and_Image_and_Icons/01_Image_Class/ImageClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/07_SizedBox_Class/SizedBoxClass.dart';
// import 'Class_02_Layout_Widget/Multi_Child_Layout_Widget/05_Table_Class/TableClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/08_ConstrainedBox_Class/ConstrainedBoxClass.dart';
// import 'Class_02_Layout_Widget/Multi_Child_Layout_Widget/06_GridView_Class/GridViewClassCountConstructor.dart';
// import "Class_02_Layout_Widget/Single_Child_Layout_Widget/10_SingleChildScrollView_Class/10_SingleChildScrollView_Class.dart";
// import "Class_02_Layout_Widget/Single_Child_Layout_Widget/11_FractionallySizedBox/11_FractionallySizedBox.dart";
// import "Class_02_Layout_Widget/Single_Child_Layout_Widget/12_Positioned_Class/12_Positioned_Class.dart";
// import "Class_02_Layout_Widget/Single_Child_Layout_Widget/13_Flexible_Class/13_Flexible_Class.dart";
// import 'Class_04_Input/01_Form_Class/FormClass.dart';
// import 'Class_04_Input/02_TextFormField_Class/TextFormFieldClass.dart';
// import 'Class_03_Assets_and_Image_and_Icons/02_Icon_Class/IconClass.dart';
// import "Class_05_Bar/01_AppBar_Class/AppBarClass.dart";
// import 'Class_05_Bar/02_TabBar_Class/TabBarClass.dart';
// import 'Class_05_Bar/03_SnackBar_Class/SnackBarClass.dart';
// import 'Class_05_Bar/04_BottomNavigationBar_Class/BottomNavigationBarClass.dart';
// import 'Class_02_Layout_Widget/Single_Child_Layout_Widget/09_Transform_Class/TransformClass.dart';
// import 'Class_06_Navigation_and_Routing/01_First_Way/RoutePageFirstWay.dart';
// import 'Class_06_Navigation_and_Routing/02_Second_Way/RoutePageSecondWay.dart';
// import 'Class_06_Navigation_and_Routing/03_Third_Way/RoutePageThirdWay.dart';
// import 'Class_07_Media/01_Audio/AssetsAudioPlayerClass.dart';
// import 'Class_08_Sliver_Widgets/01_SliverAppBar_Class/SliverAppBarClass.dart';
// import 'Class_08_Sliver_Widgets/02_CupertinoSliverNavigationBar_Class/02_CupertinoSliverNavigationBar_Class.dart';
// import 'Class_10_Flutter_Animation/01_AnimateAlign_Class/01_AnimateAlign_Class.dart';
// import 'Class_10_Flutter_Animation/02_AnimatedBuilder_Class/02_AnimatedBuilder_Class.dart';
// import 'Class_11_Asynchronous_Programming/Class_11_Asynchronous_Programming.dart';
// import 'Class_12_Flutter_API/01_Get_Method.dart';
// import 'Class_06_Navigation_and_Routing/04_Map_&_Routing/Main_Routing_Page.dart';
// import 'Class_13_Widget_Lifecycle/02_StateFul_Widget/01_InitState_Method/HomePage.dart';
// import 'package:env/Class_06_Navigation_and_Routing/05_Passing_Route_Data/Main_Routing_Page.dart';
// import 'Class_02_Layout_Widget/Other_Layout_Widgets/01_Drawer_Widget/01_Drawer_Widget.dart';
// import 'Class_14_Detector_and_Indicator/01_Gesture_Detector_Class/01_Gesture_Detector_Class.dart';
// import "Class_14_Detector_and_Indicator/02_RefreshIndicator_Class/02_RefreshIndicator_Class.dart";
// import 'Class_15_Other_Widgets/01_Buttons/Flutter_Buttons.dart';
// import "Class_15_Other_Widgets/02_Circle_Avatar_Class/02_Circle_Avatar_Class.dart";
// import 'Class_15_Other_Widgets/03_Toast/01_Toast/01_Toast.dart';
// import "Class_17_State_Management/01_setState_Method/setState.dart";
// import 'Class_17_State_Management/02_Redux/02_Redux.dart';
// import "Class_18_Notification/01_Local_Push_Notifications/01_Local_Push_Notifications.dart";
// import "Class_05_Bar/05_Search_Bar/05_Search_Bar.dart";
// import "Class_19_Passing_Data_Between_Wedget/01_Passing_Data_From_Parent_to_Child_and_Child_To_Parent/01_Passing_Data_From_Parent_to_Child_and_Child_To_Parent.dart";
// import 'Class_20_Auth_or_SignIn_from_Flutter/01_Google_Signing_using_Firebase/01_Google_Signing_using_Firebase.dart';
// import "Class_20_Auth_or_SignIn_from_Flutter/03_Flutter_Authentication_with_MongoDB_Nodejs_and_Express/client/03_Flutter_Authentication_with_MongoDB_Nodejs_and_Express.dart";
// import "Class_21_Flutter_Cache/01_Cache_Using_HIVE_DB/client/01_Cache_Using_HIVE_DB.dart";
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'Class_00_Other_Topics/02_Builder/01_Builder_Class/01_Builder_Class.dart';
// import 'Class_00_Other_Topics/02_Builder/02_ListView_Builder/02_ListView_Builder.dart';
// import 'Class_00_Other_Topics/03_Env/03_Env.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'Class_00_Other_Topics/03_Env/models/environment.dart';
// import 'Class_22_Flutter_Curved_Widget/01_Flutter_Custom_Clipper/01_Flutter_Custom_Clipper.dart';
// import 'package:env/Class_23_Responsive_and_Adaptive_Flutter/01_Responsive01/01_Responsive01.dart';
// import "package:env/Class_24_AlertDialog/01_AlertDialog_Class_and_Exiting_App/01_AlertDialog_Class.dart";
// import 'Class_25_File/01_Read_and_Write_Files/01_Read_and_Write_Files.dart';
import "Class_25_File/02_File_Picker/02_File_Picker.dart";

void main() async {
  // Class 21 -------------
  // await Hive.initFlutter();
  runApp(MyApp());
}

// Class 00 ---------------
// Future<void> main() async {
//   await dotenv.load(fileName: Environment.fileName);
//   // await dotenv.load(fileName: ".env");
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Class 00 ----------------
    // return BuilderClass();
    // return ListViewBuilder();
    // return FlutterEnv();
    // return FutureBuilderClass();

    // class 01-----------------
    // return TextWidget();
    // return RichTextWidget();

    // class 02-----------------
    // return ContainerClass();
    // return AlignClass();
    // return CenterClass();
    // return ColumnClass();
    // return RowClass();
    // return StackClass();
    // return AspectRatioClass();
    // return BaseLineClass();
    // return ExpandedClass();
    // return ListViewClass();
    // return SizedBoxClass();
    // return TableClass();
    // return ConstrainedBoxClass();
    // return GridViewClassCountConstructor();
    // return TrasnsformClass();
    // return DrawerWidget();
    // return SingleChildScrollViewClass();
    // return FractionallySizeboxClass();
    // return PositionedClass();
    // return FlexibleClass();

    // Class 03-----------------
    // return ImageClass();
    // return IconClass();

    // Class 04-----------------
    // return FormClass();
    // return TextFormFieldClass();

    // Class 05-----------------
    // return AppBarClass();
    // return TabBarClass();
    // return SnackBarClass();
    // return BottomNavigationBarClass();
    // return SearchBar();

    // Class 06-----------------
    // return RoutePageFirstWay();
    // return RoutePageSecondWay();
    // return RoutePageThirdWay();
    // return MainRoutingPage();
    // return RoutingPassingDataPage();

    // class 07-----------------
    // return AssetsAudioPlayerClass();

    // Class 08-----------------
    // return SliverAppBarClass();
    // return CupertinoSilverNavigationBar();

    // Class 10-----------------
    // return AnimateAlignClass();
    // return AnimatedBuilderClass();

    // Class 11------------------
    // return AsynchronousProgramming();

    // Class 12------------------
    // return FlutterAPIGet();

    // Class 13------------------
    // return StateFullWidgetClass();

    // Class 14------------------
    // return GestureDetectorClass();
    // return RefreshIndicatorClass();

    // Class 15------------------
    // return FlutterButtonWidget();
    // return CircleAvatarClass();
    // return Toast01();

    // Class 17 ------------------
    // return SetStateMng();
    // return FlutterRedux();

    // Class 18 ------------------
    // return MaterialApp(
    //   home: PushNotification(),
    // );

    // Class 19 ------------------
    // return PassingData();

    // Class 20 -----------------
    // return GoogleSignInUsingFirebase();
    // return FlutterAuthUsingNME();

    // Class 21 ----------------
    // return HiveDatabase();

    // Class 22 ------------------
    // return FlutterCustomClipperWidget();

    // Class 23 --------------------
    // return ResponsiveFlutter01();

    // Class 24 ------------------------
    // return MaterialApp(
    //   home: AlertDialogClass(),
    // );

    // Class 25 ------------------------
    // return MaterialApp(
    //   home: ReadAndWriteFile(),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilePickerClass(),
    );
  }
}

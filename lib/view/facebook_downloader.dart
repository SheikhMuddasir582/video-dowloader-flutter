import'package:flutter/material.dart';
import 'package:video_downloader/components/ad_container.dart';
import 'package:video_downloader/components/enter_url.dart';
import 'package:video_downloader/components/paste_button.dart';

// import '../components/custom_navigation_bar.dart';

class FaceBookDOwnloadScreen extends StatefulWidget {
  const FaceBookDOwnloadScreen({super.key});

  @override
  State<FaceBookDOwnloadScreen> createState() => _FaceBookDOwnloadScreenState();
}

class _FaceBookDOwnloadScreenState extends State<FaceBookDOwnloadScreen> {

  final TextEditingController urlController= TextEditingController(); 

// int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Facebook Video Downloader', style: TextStyle(fontSize: 16),),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              EnterUrl(onTap: (){
          
              }, controller: urlController,
              ),
              const AdContainer(),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                PasteButton(
                title: 'Paste', 
                onTap: (){
          
              }
              ),
          
              PasteButton(
                title: 'Download', 
                onTap: (){
          
              }
              ),
                ],
              )
          
            ],
          ),
        ),
        // bottomNavigationBar: CustomBottomNavigationBar(
        //   selectedIndex: _selectedIndex,
        //   onItemSelected: _onItemTapped,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       // icon: ImageIcon(AssetImage('images/tabImg.png')),
        //       icon: Icon(Icons.tab),
        //       label: 'Tab',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.autorenew),
        //       label: 'Progress',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.folder),
        //       label: 'Folder',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
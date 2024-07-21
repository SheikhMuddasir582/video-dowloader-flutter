import'package:flutter/material.dart';
import 'package:video_downloader/components/ad_container.dart';
import 'package:video_downloader/components/enter_url.dart';
import 'package:video_downloader/components/paste_button.dart';

// import '../components/custom_navigation_bar.dart';

class InstaDownloadScreen extends StatefulWidget {
  const InstaDownloadScreen({super.key});

  @override
  State<InstaDownloadScreen> createState() => _InstaDownloadScreenState();
}

class _InstaDownloadScreenState extends State<InstaDownloadScreen> {

  final TextEditingController urlController= TextEditingController(); 

// int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Video Downloader', style: TextStyle(fontSize: 16),),
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
    );
  }
}
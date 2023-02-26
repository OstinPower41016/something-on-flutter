import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.completed;
  int? indexOfPlayingSong;

  List<PlatformFile> listOfSongs = [];


  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((event) {
      print(event);
      setState(() {
        playerState = event;
      });
    });
  }

  void pickSong() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        listOfSongs = [...listOfSongs, ...result.files];
      });
    }
  }

  void playSong(String pathToFile, int index) async {
    await audioPlayer.play(DeviceFileSource(pathToFile)); 

    setState(() {
      indexOfPlayingSong = index;
    });
  }

  void pauseSong() async {
    await audioPlayer.pause(); 
  }

  void stopSong() async {
    await audioPlayer.stop();
  }

  void removeSong(int indexOfSong) {
    setState(() {
      listOfSongs = [
      ...listOfSongs.sublist(0, indexOfSong), 
      ...listOfSongs.sublist(indexOfSong + 1)];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Songs screen"), centerTitle: true),
      body: Center(
        child: ListView.builder(
          itemCount: listOfSongs.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(alignment: Alignment.centerLeft, child: Text(listOfSongs[index].name)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                      indexOfPlayingSong == index && playerState == PlayerState.playing 
                        ? 
                        ElevatedButton(
                          onPressed: () => pauseSong(), 
                          child: Icon(Icons.pause)
                        )
                       :
                       ElevatedButton(
                          onPressed: () => playSong(listOfSongs[index].path!, index), 
                          child: Icon(Icons.play_circle)
                        ),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: stopSong, child: Icon(Icons.stop)),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: () => removeSong(index), child: Icon(Icons.delete)),
                      ],
                    )
                  ],
                ),
              )
            );
          }),
      ) ,
      floatingActionButton: 
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => pickSong()
        ),
    );
  }
}

import 'package:just_audio/just_audio.dart';

class AudioPlayerController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Stream<int> get progressStream => _audioPlayer.positionStream.map((progress) {
        final currentProgress = progress.inMilliseconds;
        if (currentProgress == durationInMill) {
          
          _audioPlayer.pause();
          _audioPlayer.seek(Duration.zero);
        }

        return currentProgress;
      });
  Future<void> setSpeed(double speed) async {
    if (speed <= 0.0) {
      throw ArgumentError.value(speed, 'speed', 'Must be greater than 0.0.');
    }
    await _audioPlayer.setSpeed(speed);
  }

  int get durationInMill => _audioPlayer.duration?.inMilliseconds ?? 0;
  Stream<bool> get playStatusStream => _audioPlayer.playingStream;

  Future<void> loadAudio(String filePath) async {
    if (filePath.isEmpty) {
      throw ArgumentError.value(filePath, 'filePath', 'Must not be empty.');
    }
    await _audioPlayer.setUrl(filePath);
    await _audioPlayer.load();
    _audioPlayer.play();
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() async {
    _audioPlayer.pause();
  }

  void stop() async {
    _audioPlayer.stop();
  }

  void seek(int durationInMill) {
    _audioPlayer.seek(Duration(milliseconds: durationInMill));
  }

  void dispose() async {
    await _audioPlayer.stop();
    _audioPlayer.dispose();
  }
}

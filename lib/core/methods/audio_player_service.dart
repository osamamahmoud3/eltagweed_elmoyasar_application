import 'package:just_audio/just_audio.dart';

class AudioPlayerController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  LockCachingAudioSource? _audioSource;

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

  Future<void> loadAudio(String url) async {
    if (url.isEmpty) {
      throw ArgumentError.value(url, 'url', 'Must not be empty.');
    }
    _audioSource = LockCachingAudioSource(Uri.parse(url));
    await _audioPlayer.setAudioSource(_audioSource!);
    await _audioPlayer.load();
    _audioPlayer.play();
  }

  Future<void> clearCache() async {
    await _audioSource?.clearCache();
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void seek(int durationInMill) {
    _audioPlayer.seek(Duration(milliseconds: durationInMill));
  }

  void dispose() async {
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
  }
}

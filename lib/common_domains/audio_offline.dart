class AudioOffline {
  final String id;
  final String name;
  final String image;
  final bool isSubscriptionRequired;

  AudioOffline({
    required this.id,
    required this.name,
    required this.image,
    this.isSubscriptionRequired = false,
  });
}

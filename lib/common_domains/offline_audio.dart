class OfflineAudio {
  final String id;
  final String title;
  final String image;
  final bool isSubscriptionRequired;

  OfflineAudio({
    required this.id,
    required this.title,
    required this.image,
    this.isSubscriptionRequired = false,
  });
}

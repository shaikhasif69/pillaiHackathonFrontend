class EventModel {
  final String? id;
  final String? name;
  final String? location;
  final String? imageUrl;
  final String? date;
  final String? month;

  EventModel({
    this.id,
    this.name,
    this.location,
    this.imageUrl,
    this.date,
    this.month,
  });
}

final events = [
  EventModel(
    id: '1',
    name: 'Lampion: From Earth to Moon 2022',
    location: 'Bandung, ID',
    imageUrl: 'assets/img_event_1.png',
    date: '9',
    month: 'Sept',
  ),
  EventModel(
    id: '2',
    name: 'Car Free Day in Bandung 06:00 PM - 10:00 PM',
    location: 'Bandung, ID',
    imageUrl: 'assets/img_event_2.png',
    date: '12',
    month: 'Sept',
  ),
];

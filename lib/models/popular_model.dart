class PopularModel {
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? isTicket;
  final String? date;
  final String? time;

  PopularModel({
    this.id,
    this.name,
    this.imageUrl,
    this.isTicket,
    this.date,
    this.time,
  });
}

final populars = {
  PopularModel(
    id: 1,
    name: 'Dancing in The Moon',
    date: '9 August 2022',
    time: '17:00 PM',
    isTicket: 'Free',
    imageUrl: 'assets/img_event_3.png',
  ),
  PopularModel(
    id: 1,
    name: 'Car Free Day in Bandung',
    date: '12 September 2022',
    time: '17:00 PM',
    isTicket: 'Free',
    imageUrl: 'assets/img_event_4.png',
  ),
};

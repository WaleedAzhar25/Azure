class BoardingContent {
  String image;
  String title;
  String discription;

  BoardingContent(
      {required this.image, required this.title, required this.discription});
}

List<BoardingContent> onBoardingContent = [
  BoardingContent(
      title: 'Enjoy The beautiful world',
      image: 'assets/images/bg.png',
      discription:
      "The Most Relevant information. 100% Privacy Protected! Find what you are looking for Here"),
  BoardingContent(
      title: 'House you dreamed for',
      image: 'assets/images/bg.png',
      discription:
      "Real Estate Agents are professionals who help home buyers find a new home"),
  BoardingContent(
      title: 'Find your home',
      image: 'assets/images/bg.png',
      discription: "Real Estate Agents are professionals who help home buyers"),
];
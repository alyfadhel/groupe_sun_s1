class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<OnBoardingModel> boarding = [
  OnBoardingModel(
      image: 'assets/images/on_boarding.jpg',
      title: 'onBoarding Title 1',
      body: 'OnBoarding Body 1'),
  OnBoardingModel(
      image: 'assets/images/on_boarding.jpg',
      title: 'onBoarding Title 2',
      body: 'OnBoarding Body 2'),
  OnBoardingModel(
      image: 'assets/images/on_boarding.jpg',
      title: 'onBoarding Title 3',
      body: 'OnBoarding Body 3'),
];

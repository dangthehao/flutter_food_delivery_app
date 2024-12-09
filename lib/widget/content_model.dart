class UnboardingContent {
  String image;
  String title;
  String decription;

  UnboardingContent(
      {required this.image, required this.title, required this.decription});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      image: 'images/onboardingfood1.jpg',
      title: 'Select from Out \n     Best Menu',
      decription: 'Pick your food from our menu\n        More than 35 times'),
  UnboardingContent(
      image: 'images/onboardingfood1.jpg',
      title: 'Easy and Online Payment',
      decription: '       You can pay cash on delivery and Card       \n                        payment is available'),
  UnboardingContent(
      image: 'images/onboardingfood1.jpg',
      title: 'Quick Delivery at your Doorstep',
      decription: 'Deliver your food at your \n               Doorstep'),
];
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int _pageIndex = 0 ;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: demoData.length,
              controller: _pageController,
              onPageChanged:(index) {
                setState(() {
                  _pageIndex = index ;
                });
              },
              itemBuilder: (context, index) => OnBoardContent(
                image: demoData[index].image,
                title: demoData[index].title,
                description: demoData[index].description,
              ),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                demoData.length,(
                  (index) =>  
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: DotIndicator(isActive: index == _pageIndex ,),
                  ))),
              const Spacer(),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.arrow_forward_sharp)),
              ),
           ],
          )
        ],
      ),
    )));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive? 12: 6 ,
      width: 6,
      decoration:  BoxDecoration(
          color: isActive ? Colors.blue : Colors.blue.withOpacity(0.4),
          borderRadius:const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> demoData = [
  OnBoard(
      image: 'assets/illustrations/open.jpg',
      title: "Welcome to Shopify!",
      description:
          "Discover a world of endless shopping possibilities. Explore thousands of products, find the best deals, and enjoy a seamless shopping experience right at your fingertips."),
  OnBoard(
      image: 'assets/illustrations/buy.jpg',
      title: "Find Your Style.",
      description:
          "Unleash your fashion sense! Browse through our extensive collection of clothing, shoes, and accessories. Stay up-to-date with the latest trends and create your perfect look."),
  OnBoard(
      image: 'assets/illustrations/sale.jpg',
      title: "Never Miss a Sale.",
      description:
          "Get ready for incredible savings! Receive personalized notifications about exclusive discounts, limited-time offers, and flash sales. Shop smart and never miss a deal again."),
  OnBoard(
      image: 'assets/illustrations/easy.jpg',
      title: "Effortless Checkout.",
      description:
          "Say goodbye to long queues! Our streamlined checkout process makes buying your favorite products a breeze. Save time and enjoy secure transactions with just a few taps."),
  OnBoard(
      image: 'assets/illustrations/wishlist.jpg',
      title: "Personalized Recommendation.",
      description:
          "Discover products tailored just for you. Our intelligent algorithms analyze your preferences and browsing history to provide personalized recommendations that match your style and interests."),
];

class OnBoardContent extends StatelessWidget {
  final String image, title, description;

  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}

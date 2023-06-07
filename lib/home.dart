import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    
    super.initState();
    initBannerAd();
  }

  late BannerAd bannerAd ;
  bool isAdLoaded = false;
  var adUnit = "ca-app-pub-3940256099942544/6300978111";

  initBannerAd(){
    bannerAd = BannerAd(
      size: AdSize.banner, 
      adUnitId: adUnit, 
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          
        },
      ), 
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Test'),
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
      body: const Center(
        child: Text("test"),
      ),
      bottomNavigationBar: isAdLoaded ? SizedBox(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd),
      ): const SizedBox(),
    );
  }
}
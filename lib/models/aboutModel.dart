import 'package:flutter/material.dart';

class AboutSlider {
  String image;
  String description;
  String title;
  AboutSlider({
    @required this.image,
    @required this.description,
    @required this.title
    });
}

List<AboutSlider> sliderContent = [AboutSlider(image:"assets/images/whyglug.png", description: "The purpose of a GLUG is to equip students with FOSS and make them understand how FOSS is developed and why is it done so. While doing that - how one can contribute back to FOSS.", title: "The purpose of a GLUG!"),
  AboutSlider(image: "assets/images/join.png", description: "Free Software Movement Karnataka is a registered not-for-profit organization. Our primary objective is to create and spread awareness of Free Software technologies in different strata of society.", title: "Be a part of the FSMK team!")
];
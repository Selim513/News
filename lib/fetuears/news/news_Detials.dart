// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_sport_app/core/news_model/article.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.model,
  });
  final Article model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: (model.urlToImage == null)
                      ? const Center(
                          child: SizedBox(
                          width: double.infinity,
                        ))
                      : Image.network(
                          model.urlToImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
              const Gap(10),
              Text(
                '${model.title}',
                style: getmeduimfont(),
              ),
              const Gap(20),
              Row(
                children: [
                  Text(
                    model.publishedAt!.split('T').first,
                    style: getsmallfont(color: Colors.blue),
                  ),
                ],
              ),
              const Gap(30),
              Row(
                children: [
                  Text(
                    'Author: ${model.author}',
                    style: getmeduimfont(color: Colors.green),
                  ),
                ],
              ),
              const Gap(20),
              Text(
                '${model.description}',
                style: getmeduimfont(),
              ),
              const Gap(10),
              Row(
                children: [
                  Text(
                    '${model.source}',
                    style: getsmallfont(color: Colors.blue),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black),
                    onPressed: () async {
                      await launchUrl(Uri.parse(model.url ?? ''));
                    },
                    child: Text(
                      'Visit the website',
                      style: getmeduimfont(),
                    )),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

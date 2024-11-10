import 'package:ai_assistant/controller/image_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widget/custom_btn.dart';
import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate images with AI'),
      ),

      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top:mq.height*.08, bottom:mq.height*.08, left:mq.width*.04, right:mq.width* .04 ),
        children:[
          TextFormField(
              controller:_c.textC,
              minLines: 5,
              maxLines: null,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                fillColor:Color.fromARGB(255, 235, 235, 255),
                filled:true,
                hintText: "Imagine something creative and i will create it for you ill create it for you ",
                hintStyle: TextStyle(fontSize: 13),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),),
            ),
          const SizedBox(height:65),
            //bttton
          CustomBtn(onTap: _c.createImage, text:'Generate'),

          Container(
            height: mq.height * .5,
            alignment: Alignment.center,
            child: Obx(() => _aiImage()),
          ),
        ],
      ),
    );
  }

  Widget _aiImage() {
    switch (_c.status.value) {
      case Status.none:
        return const SizedBox.shrink();
      case Status.complete:
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: CachedNetworkImage(
            imageUrl: _c.url,
            placeholder: (context, url) => const CustomLoading(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      case Status.loading:
        return const CustomLoading();
      default:
        return const SizedBox.shrink();
    }
  }
}
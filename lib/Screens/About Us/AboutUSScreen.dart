import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName="/aboutUs";

  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context,actions: false,title: "عن التطبيق"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage('assets/bghome.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 12,
                      right: 30,
                      child: Image.asset("assets/logo.png",scale: 5,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15),
              child: Container(
                width: MediaQuery.of(context).size.width*0.85,
                child: Text(
                  'خلافًا للاعتقاد الشائع ، فإن Lorem Ipsum ليس مجرد نص عشوائي. لها جذور في قطعة من الأدب اللاتيني الكلاسيكي من 45 قبل الميلاد ، مما يجعلها أكثر من 2000 عام. قام ريتشارد مكلينتوك ، أستاذ اللغة اللاتينية في كلية هامبدن سيدني في فرجينيا ، بالبحث عن واحدة من أكثر الكلمات اللاتينية غموضًا ، consectetur ، من مقطع لوريم إيبسوم ، وتصفح اقتباسات الكلمة في الأدب الكلاسيكي ، اكتشف المصدر الذي لا شك فيه. يأتي Lorem Ipsum من الأقسام 1.10.32 و 1.10.33 من "de Finibus Bonorum et Malorum" (أقصى الخير والشر) بقلم شيشرون ، الذي كتبه عام 45 قبل الميلاد. هذا الكتاب عبارة عن أطروحة حول نظرية الأخلاق ، وقد حظيت بشعبية كبيرة خلال عصر النهضة. السطر الأول من Lorem Ipsum ، "Lorem ipsum dolor sit amet .." ، يأتي من سطر في القسم 1.10.32.\n\nالجزء القياسي من لوريم إيبسوم المستخدم منذ القرن الخامس عشر مستنسخ أدناه للمهتمين. تم أيضًا نسخ الأقسام 1.10.32 و 1.10.33 من "de Finibus Bonorum et Malorum" بواسطة Cicero في شكلها الأصلي بالضبط ، مصحوبة بنسخ باللغة الإنجليزية من ترجمة عام 1914 بواسطة H. Rackham.\n\nهناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. الهدف من استخدام لوريم إيبسوم هو أنه يحتوي على توزيع طبيعي -إلى حد ما- للأحرف ، بدلاً من استخدام "هنا يوجد محتوى نصي ، هنا يوجد محتوى نصي" ، مما يجعلها تبدو وكأنها إنجليزية قابلة للقراءة. تستخدم العديد من حزم النشر المكتبي ومحرري صفحات الويب الآن Lorem Ipsum كنص نموذج افتراضي ، وسيكشف البحث عن "lorem ipsum" عن العديد من مواقع الويب التي لا تزال في مهدها. تطورت إصدارات مختلفة على مر السنين ، أحيانًا عن طريق الصدفة ، وأحيانًا عن قصد (روح الدعابة المحقونة وما شابه ذلك).',
                  style: TextStyle(
                    fontSize: 17,
                    color: const Color(0xff3b3b4d),
                    height: 1.7,

                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

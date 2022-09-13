import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/services/api/classification_services.dart';
import 'package:mobile_app/app/widgets/my_widget.dart';

class SurveyController extends GetxController {
  RxList<String> symptoms = [
    "Batuk",
    "Nyeri Otot",
    "Lelah",
    "Sakit Tenggorokan",
    "Pilek",
    "Hidung Tersumbat",
    "Demam",
    "Mual-mual",
    "Muntah-muntah",
    "Diare",
    "Nafas Pendek",
    "Susah Bernafas",
    "Hilang Rasa",
    "Hilang Penciuman",
    "Hidung Gatal",
    "Mata Gatal",
    "Mulut Gatal",
    "Telinga Dalam Gatal",
    "Bersin-bersin",
    "Mata Pink",
  ].obs;

  RxList<String> symptomsInfo = [
    "Berdasarkan penyebabnya\n\nHal pertama yang membedakan batuk biasa dan batuk gejala COVID-19 adalah penyebabnya. Umumnya, batuk biasa bisa disebabkan oleh flu, misalnya karena virus influenza atau rhinovirus, sedangkan batuk gejala COVID-19 disebabkan oleh virus Corona.\nSementara itu, lamanya waktu hingga muncul gejala batuk pun berbeda. Batuk flu biasanya baru muncul selama 1–3 hari setelah terpapar virus, sedangkan batuk gejala COVID-19 sekitar 2–14 hari.\nWalau berbeda, cara penularan kedua batuk ini tetap sama, yaitu melalui udara, percikan liur dan ingus (droplet), dan kontak fisik dengan orang yang sakit.\nBerdasarkan komplikasi yang dapat ditimbulkan\n\nBatuk biasa akibat flu dapat sembuh dalam waktu beberapa hari hingga beberapa minggu. Namun, bila batuk yang Anda derita telah berlangsung lebih dari 3 minggu, batuk tersebut sudah dikategorikan sebagai batuk kronis. Batuk yang lama sembuh ini lebih sering terjadi pada penderita asma, COPD, atau sinusitis.\nJika tidak diobati dengan baik, flu yang menyebabkan batuk biasa terkadang bisa menimbulkan sejumlah komplikasi, seperti pneumonia.\nDi sisi lain, COVID-19 yang menimbulkan gejala batuk juga berpotensi menimbulkan komplikasi berupa pneumonia dan ARDS. Namun, risiko terjadinya komplikasi tersebut lebih tinggi pada penderita yang belum mendapatkan vaksin COVID-19, memiliki penyakit komorbid, atau berusia lanjut.\nPada kasus tertentu, COVID-19 juga bisa menyebabkan gejala atau masalah kesehatan yang berlangsung lama, bahkan setelah infeksinya sembuh, seperti anosmia, parosmia, dan long-haul COVID-19.",
    "Nyeri otot akibat COVID-19 sulit dibedakan dengan nyeri otot akibat cedera olahraga. Nyeri akibat virus cenderung menyebar ke seluruh jaringan otot, sedangkan nyeri akibat cedera olahraga cenderung menyerang otot tertentu saja.\nNyeri otot akibat gejala COVID-19 cenderung sembuh dalam beberapa minggu hingga bulan setelah infeksi penyakit sembuh, sedangkan nyeri otot akibat cedera olahraga akan sembuh dalam waktu 48-72 jam.",
    "Perbedaan nyata gejala lelah biasa dan akibat COVID-19 terletak pada kadar saturasi oksigen di dalam tubuh.\nSelain itu, lelah yang bukan akibat COVID-19 juga biasanya tidak disertai dengan gejala-gejala lain, seperti kehilangan indra penciuman, batuk kering, sakit tenggorokan, demam, dan lain sebagainya.",
    "Jika kamu mencurigai sakit tenggorokan yang kamu alami adalah karena virus corona, kamu perlu ingat-ingat apakah belakangan kamu pernah keluar rumah dan lupa mencuci tangan atau melakukan physical distancing. Namun, kamu sebaiknya menyingkirkan skenario terburuk ini, sebab penelitian menunjukkan hanya 5 hingga 14 persen orang dengan COVID-19 mengalami rasa sakit atau iritasi di tenggorokan.\n\nSelain sakit tenggorokan, gejala yang lebih umum dari COVID-19 adalah demam, batuk kering, kesulitan bernapas, kelelahan, sakit kepala, dan tiba-tiba kehilangan rasa atau bau. Jadi, sebaiknya kamu lebih berfokus pada gejala-gejala ini.",
    "Flu biasa juga bisa menyebabkan hilangnya penciuman akibat hidung tersumbat atau bersin terus menerus. Namun, bila kamu kehilangan penciuman secara tiba-tiba, kemungkinan besar itu adalah gejala Omicron. Bedanya gejala flu biasa dan omicron lainnya adalah omicron bisa menyebabkan sulit bernapas atau sesak napas, sementara flu biasa biasanya tidak menyebabkan gejala tersebut.",
    "Gejala infeksi varian Omicron memang sangat mirip dengan flu biasa. Walhasil seiring lonjakan kasus COVID-19 RI kini, masyarakat diminta untuk tidak menyepelekan gejala seringan flu. Di antaranya, berupa hidung mampet dan meler.\n\nSpesialis paru RS Persahabatan dan Pokja Infeksi Pengurus Pusat Perhimpunan Dokter Paru Indonesia (PDPI), dr Erlina Burhan, SpP(K) menjelaskan gejala paling khas pada pasien Omicron yang tidak umum dialami pengidap flu adalah masalah tenggorokan. Misalnya gatal, nyeri, dan rasa sakit saat menelan makanan.",
    "Demam umumnya terjadi sebagai reaksi dari sistem imun dalam melawan infeksi kuman penyebab penyakit. Beberapa penyakit yang sering menyebabkan demam adalah flu, radang tenggorokan, dan infeksi saluran kemih.",
    "Belum ada info terkait",
    "Gejala ini mungkin bertahan satu(1) hari",
    "Untuk mengetahui perbedaan diare COVID dan bukan COVID, kamu bisa amati dari tampilan fesesnya seperti berikut:\n1. Tekstur Diare Berair\n\nMasih dalam penelitian yang sama dengan sebelumnya, sebanyak 64 persen pasien COVID-19 melaporkan diare dengan feses berair.\nFeses berair dapat menunjukkan bahwa kamu telah kehilangan cukup banyak cairan di dalam tubuh. Hal ini dapat menyebabkan dehidrasi. Itulah mengapa penting bagi penderita COVID untuk tetap terhidrasi saat mengalami diare.\n\n2. Feses Berwarna Kuning\n\nPenelitian lain yang diterbitkan pada Clinical Gastroenterology and Hepatology juga melaporkan kondisi feses akibat diare terkait COVID-19. Kebanyakan pasien mengalami feses berwarna kuning.\nVirus dapat menyebabkan diare kuning karena tinja bergerak terlalu cepat melalui usus. Ketika feses bergerak dengan kecepatan normal, usus mampu menyerap lemak di dalamnya.\nAkan tetapi, ketika feses terlalu cepat, lemaknya tidak terserap maksimal. Lemak inilah yang  memberi warna kuning pada feses.\n\n3. Tinja Berwarna Hijau\n\nSelain berwarna kuning, diare COVID-19 juga dapat menyebabkan feses berwarna kehijauan. Ini terjadi akibat lemak tidak terurai dengan baik, akibatnya empedu yang ada di feses dapat menyebabkan diare tampak hijau.\nEmpedu adalah zat yang dikeluarkan oleh kantong empedu dan hati untuk membantu mencerna lemak.",
    "Walaupun sesak napas adalah gejala Covid-19 yang paling serius, umumnya kesulitan bernapas bukanlah gejala awal yang dirasakan. Serangan virus yang ringan jarang mengakibatkan gejala sesak napas, dengan estimasi sekitar 1,4-7,6% saja yang melaporkan kesulitan bernapas. Data juga menunjukkan sesak napas umumnya muncul sekitar 5-10 hari menyusul gejala lain seperti sakit kepala, batuk, dan demam.\nBeberapa ciri gejala sesak napas akibat serangan virus corona antara lain:\n•Sering disertai dengan batuk kering dan demam, walaupun beberapa penderita melaporkan tidak ada gejala tersebut.\n•Bagian dada terasa ketat.\n•Kesulitan menarik napas dalam-dalam.",
    "Walaupun sesak napas adalah gejala Covid-19 yang paling serius, umumnya kesulitan bernapas bukanlah gejala awal yang dirasakan. Serangan virus yang ringan jarang mengakibatkan gejala sesak napas, dengan estimasi sekitar 1,4-7,6% saja yang melaporkan kesulitan bernapas. Data juga menunjukkan sesak napas umumnya muncul sekitar 5-10 hari menyusul gejala lain seperti sakit kepala, batuk, dan demam.\nBeberapa ciri gejala sesak napas akibat serangan virus corona antara lain:\n•Sering disertai dengan batuk kering dan demam, walaupun beberapa penderita melaporkan tidak ada gejala tersebut.\n•Bagian dada terasa ketat.\n•Kesulitan menarik napas dalam-dalam.",
    "Hilang indra penciuman atau anosmia merupakan salah satu gejala COVID-19. Namun, orang yang terkena flu biasa juga terkadang bisa mengalami kehilangan indra penciuman.\nBedanya, pasien COVID-19 umumnya mengalami gejala ini secara tiba-tiba dan kondisinya bisa lebih parah. Pasalnya, saat kehilangan indra penciuman, hidung mereka biasanya tidak tersumbat atau meler seperti pasien yang mengidap flu.\nPara ahli pun menduga hal ini terjadi karena virus Corona COVID-19 menyerang sel saraf yang terlibat langsung dengan sensasi penciuman.\nProf Carl Philpott, seorang peneliti utama dari University of East Anglia melakukan tes penciuman dan rasa pada 30 relawan. Ada 10 pasien yang mengidap COVID-19, sementara lainnya mengidap flu yang lumayan berat, dan 10 orang lain dalam kondisi sehat tanpa gejala pilek atau flu.",
    "Hilang indra penciuman atau anosmia merupakan salah satu gejala COVID-19. Namun, orang yang terkena flu biasa juga terkadang bisa mengalami kehilangan indra penciuman.\nBedanya, pasien COVID-19 umumnya mengalami gejala ini secara tiba-tiba dan kondisinya bisa lebih parah. Pasalnya, saat kehilangan indra penciuman, hidung mereka biasanya tidak tersumbat atau meler seperti pasien yang mengidap flu.\nPara ahli pun menduga hal ini terjadi karena virus Corona COVID-19 menyerang sel saraf yang terlibat langsung dengan sensasi penciuman.\nProf Carl Philpott, seorang peneliti utama dari University of East Anglia melakukan tes penciuman dan rasa pada 30 relawan. Ada 10 pasien yang mengidap COVID-19, sementara lainnya mengidap flu yang lumayan berat, dan 10 orang lain dalam kondisi sehat tanpa gejala pilek atau flu.",
    "Hidung gatal biasanya kerap sedang mengalami rhinitis alergi yang disertai gejala lain selain hidung gatal seperti bersin-bersin, sakit kepala, mata gatal dan hidung tersumbat. dimana rhintis alergi merupakan suatu peradangan di lapisan mukosa hidung yang terjadi akibat adanya paparan zat alergan.\nnamun tidak semua hidung gatal akibat karena rhinitis bisa pula terjadi karena termasuknya benda asing tidak sengaja hingga menyebabkan keluhan hidung gatal, hidung yang kering, mengalami iritasi. Jadi hidung gatal bukan suatu tanda terinfeksi virus corona, namun jika memang disertai dengan keluhan mirip seperti flu dan anda ada resiko terpapar dengan orang yang postif corona anda bisa waspada akan tertular untuk mengetahuinya dengan melakukan pemeriksaan covid.",
    "Beberapa studi menyatakan bahwa varian Covid-19 sebelum Omicron memang menyebabkan konjungtivitis atau peradangan berupa mata gatal dan merah. American Academy of Ophtalmology, mengatakan bahwa kongjungtivitis bisa diikuti dengan gejala seperti mata kemerahan, gatal, mata berair, dan pandangan yang terganggu. Dari hal tersebut, para ahli menyatakan bahwa konjungtivitis atau mata gatal juga bisa muncul pada varian Omicron.",
    "Belum ada info terkait",
    "Belum ada info terkait",
    "Studi ZOE menemukan bersin lebih dari biasanya dapat menjadi tanda Covid-19 pada orang yang telah divaksinasi. Namun studi ini juga menekankan, bersin jauh lebih mungkin menjadi tanda pilek atau alergi. Dikatakan bahwa meski banyak orang yang terinfeksi virus corona mengalami bersin, itu bukan gejala yang pasti karena bersin sangat umum.",
    "Tidak semua mata merah pasti adalah gejala COVID-19. Konjungtivitis bisa disebabkan oleh berbagai macam bakteri dan virus. Selain itu, mata merah juga bisa dipicu oleh alergi musiman yang menyebabkan mata gatal, berair dan bengkak. Iritasi, seperti polusi udara, klorin di kolam renang dan paparan bahan kimia beracun juga bisa menyebabkan mata merah. Lantas, apa bedanya mata merah dengan gejala COVID-19.\n\nMenurut AOA dan Centers for Disease Control and Prevention (CDC), berikut adalah beberapa gejala umum dari mata merah muda atau konjungtivitis:\n\n•Warna merah di bagian putih mata.\n•Pembengkakan konjungtiva dan atau kelopak mata.\n•Peningkatan kepekaan terhadap cahaya.\n•Perasaan berpasir di satu atau kedua mata.\n•Peningkatan produksi air mata.\n•Merasa seperti ada benda asing di mata atau keinginan untuk menggosok mata.\n•Gatal, iritasi, dan/atau terbakar.\n•Keluar cairan dari mata.\n•Lensa kontak terasa tidak nyaman dan/atau tidak menempel pada mata.\n\nMata merah diduga merupakan gejala COVID-19 bila disertai dengan gejala berikut:\n\n•Demam.\n•Batuk.\n•Sesak napas atau kesulitan bernapas.\n•Warna kebiruan pada bibir atau wajah.\n•Nyeri dada.\n•Kelelahan ekstrem.\n•Kehilangan penciuman dan atau perasa.",
  ].obs;

  RxList<int> mySymptoms = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].obs;

  RxInt currentIndex = 0.obs;
  RxInt totalIndex = 20.obs;

  final PageController pageController = PageController();
  @override
  void onInit() {
    pageController.addListener(() {
      currentIndex.value = pageController.page!.floor();
      currentIndex.refresh();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  double getProgressWidth() {
    double maxWidth = Get.width - 32.0;
    var tempIndex = currentIndex.value + 1;
    var perItem = 0.05;
    var index = tempIndex * perItem;
    return maxWidth * index;
  }

  showDialog() {
    Get.dialog(
      Dialog(child: dialogContent()),
    );
  }

  Widget dialogContent() {
    var content = {
      "Batuk": mySymptoms[0],
      "Nyeri Otot": mySymptoms[1],
      "Lelah": mySymptoms[2],
      "Sakit Tenggorokan": mySymptoms[3],
      "Pilek": mySymptoms[4],
      "Hidung Tersumbat": mySymptoms[5],
      "Demam": mySymptoms[6],
      "Mual-mual": mySymptoms[7],
      "Muntah-muntah": mySymptoms[8],
      "Diare": mySymptoms[9],
      "Nafas Pendek": mySymptoms[10],
      "Susah Bernafas": mySymptoms[11],
      "Hilang Rasa": mySymptoms[12],
      "Hilang Penciuman": mySymptoms[13],
      "Hidung Gatal": mySymptoms[14],
      "Mata Gatal": mySymptoms[15],
      "Mulut Gatal": mySymptoms[16],
      "Telinga Dalam Gatal": mySymptoms[17],
      "Bersin-bersin": mySymptoms[18],
      "Mata Pink": mySymptoms[19],
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: Get.height * 0.75,
      width: Get.width - 32,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "Rekap Gejala",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              "Sebelum mengkonfirmasi gejala Anda, silahkan untuk memastikan gejala-gejala yang Anda alami",
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content.entries
                      .map((e) => Row(
                            children: [
                              Text(
                                "${e.key}",
                                style: TextStyle(
                                  fontWeight: e.value == 0 ? FontWeight.normal : FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Row(
                                children: [
                                  Text(
                                    e.value == 0 ? "Tidak Mengalami" : "Mengalami",
                                    style: TextStyle(
                                      fontWeight: e.value == 0 ? FontWeight.normal : FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: e.value == 0 ? Colors.blueGrey[300] : Colors.blue,
                                  ),
                                ],
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: MyButtonWidget(
                    color: Colors.blueGrey[300],
                    label: "Kembali",
                    func: () {
                      Get.back();
                    },
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.01,
                ),
                Expanded(
                  child: MyButtonWidget(
                    label: "Konfirmasi",
                    func: () async {
                      await calculateResult();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> calculateResult() async {
    String data = "";
    mySymptoms.forEach((element) {
      data += element.toString();
    });
    await ApiClassificationServices().getMainClassification(data).then((value) {
      log(value.body);
    });
  }
}

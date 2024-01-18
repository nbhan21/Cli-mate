import 'package:flutter/material.dart';

class pageNews extends StatefulWidget {
  const pageNews({super.key});

  @override
  State<pageNews> createState() => _pageNewsState();
}

class _pageNewsState extends State<pageNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      
      //app
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 232, 232, 238),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 42, 105, 45),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(fontFamily: 'PlusJakartaSans'),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                suffixIcon: const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          )
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
      ), 

      body: const SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Hot News In Indonesia",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'JakartaSans',
                    fontSize: 24,
                  ),
                ),
              ),),
              Card(//berita 1
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.network(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sabtu, 13 Januari 2024",
                            style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11),
                          ),
                          Text(
                            "Tahun 2023 Adalah Tahun Terpanas Dalam Sejarah!",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Tahun 2023 resmi dinobatkan sebagai tahun terpanas di Bumi sejak pencatatan dimulai. Suhu di tahun lalu melampaui rekor sebelumnya dengan selisih yang signifikan.",
                            style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.network(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sabtu, Januari 2024",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Text(
                            "Organisasi Iklim PBB Prediksi Suhu Tahun 2024 Lebih Panas dari 2023",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          
                          Text(
                            "Suhu bumi tahun 2024 diprediksi lebih panas dibanding tahun 2023. Hal ini terjadi akibar pengaruh El Nino.",
                            style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.network(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Senin, 27 November 2023",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Text(
                            "Atasi Perubahan Iklim, Sri Mulyani: Tanpa Pembiayaan Cuma Jadi Mimpi",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          
                          Text(
                          "Menteri Keuangan, Sri Mulyani Indrawati, mengatakan bahwa upaya berbagai negara mengatasi persoalan iklim tidak semudah membalikkan telapak tangan. Menurutnya, agenda pengentasan persoalan iklim hanya menjadi mimpi tanpa rencana pembiayaan yang konkrit.",
                            maxLines: 4,
                            style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.network(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sabtu, 21 Oktober 2023",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Text(
                            "Potret Parahnya Dampak Perubahan Iklim, Ada dari Indonesia",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Perubahan iklim mengubah ekosistem, pola cuaca, kehidupan, dan perekonomian. Foto-foto ini menggambarkan keadaan planet dan iklim kita selama dekade terakhir.",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.network(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumat, 10 November 2023",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Text(
                            "3 Kota RI Masuk Top 10 Kota Hari Terpanas Beruntun Terpanjang Dunia, Ini Studinya",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Jakarta bersama Tangerang dan New Orleans, AS masuk kota dengan hari terpanas beruntun terpanjang di dunia. Tercatat hari terpanas beruntun itu selama 17 hari.",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.network(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumat, 20 Oktober 2023",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Text(
                            "Suram, Tingkat Karbon Dioksida Capai Rekor Tahun Ini",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Dua setengah bulan lagi, proyeksi mengenai kondisi iklim tahun ini akan dirilis. Sayangnya, proyeksi iklim Bumi tampaknya akan sangat suram.",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        // child: Image.asset('../assets/news_images/7.jpeg',
                        // fit: BoxFit.cover),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kamis, 14 September 2023",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Text(
                            "Pengertian Pemanasan Global: Ciri, Penyebab, hingga Cara Mengatasinya",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Secara umum, pengertian pemanasan global (global warming) adalah meningkatnya suhu rata-rata permukaan bumi. Pemanasan global terjadi akibat efek rumah kaca.",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              )
        ]
      )
      ),
    );
  }
}
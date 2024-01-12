import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<Article>> future;

  @override
  void initState(){
    future = getNewsData();
    super.initState();
  }

  Future<List<Article>>getNewsData() async{
    NewsAPI newsAPI = NewsAPI("807ef53169fa46bc95e61c14c36fbe45");
    return await newsAPI.getTopHeadlines(
      country: "id",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder(builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(snapshot.hasError){
                return const Center(
                  child: Text("Error loading the News"),
                );
              }else{
                if(snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return _buildNewsListView(snapshot.data as List<Article>);
                } else {
                  return const Center(
                    child: Text("No news available"),
                  );
                }
              }
            },
            future: future,
            ),
          )
        ],
        ),
      ),
    );
  }

  Widget _buildNewsListView(List<Article> articleList){
    return ListView.builder(
      itemBuilder: (context, index){
        Article article = articleList[index];     
        return _buildNewsItem(article);
      },
      itemCount: articleList.length,
    );
  }

  Widget _buildNewsItem(Article article){
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
                article.urlToImage ?? "",
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace){
                  return const Icon(Icons.image_not_supported);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
Widget buildArticleitem(articles , context) => Padding(
      padding: const EdgeInsets.all(.0),
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 120.0,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${articles['urlToImage']}'),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,            
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Text(
                      '${articles['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${articles['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Feature: Blog series RSS Feed

Scenario: english blog series
Given user makes html request to "/PublishedContent/RSS/syndication/rss/blog-series.rss/256"
Then the html response matches the contents of "English.txt"

Scenario: spanish blog series
Given user makes html request to "/espanol/PublishedContent/RSS/syndication/rss/blog-series.rss/256"
Then the html response matches the contents of "Spanish.txt"
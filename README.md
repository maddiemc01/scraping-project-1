# scraping-project-1

##Objectives

1. Use Nokogiri to scrape articles about current trends posted by Vogue.
2. Use scraped data to create a CLI where the user can see a list of current articles.
3. Give user option to select one of the articles and get an abstract to know what it's about.
4. User can click on the link assocaited with the article to open the web page for the full article, or select a different aricle.

##Overview

  This app will scrape Vogues webpage on current trends and list all the current articles. When the CLI starts, it will welcome the user (fashionista/fashionisto), and provide the list of articles for the user to choose from, categorized by ID, title, and author. Each article is associated with an ID number to make it easier for the user to select one.

##Navigation

1. Start the program by typing in 'ruby bin/run.rb' into the terminal
2. The program will begin by listing out all the articles; you select the ID associated with the article you're interested in.
3. For the article you chose, you will be provided the article's title, when it was written, an abtract of the article, and a link to the whole article. If you want to read the whole article you can click on the link.
4. The program will also give you the option to choose a different article or exit.
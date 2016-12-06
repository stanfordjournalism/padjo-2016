---
title: Guess
---

# Twitter Joining

A set of tweets and hashtags from those tweets from Election 2016. The hypothetical results of the queries are given, just write the query.



## Twitter Tables


### "tweets" - A list of tweets


|  ID                 | time_tweeted        | screen_name     | Text                                                                                                                                |
|---------------------+---------------------+-----------------+-------------------------------------------------------------------------------------------------------------------------------------|
|  789104196003868673 | 2016-10-20 14:01:15 | piersmorgan     | My new @DailyMail column is about last night's final presidential TV debate. Posting soon. #Trump #Clinton https://t.co/lxEkbMPHAr  |
|  789102711551635456 | 2016-10-20 13:55:21 | creynoldsnc     | Get out there, North Carolina. Let's #TurnNCBlue https://t.co/6g0EeYDfWa                                                            |
|  789101425557110784 | 2016-10-20 13:50:15 | brianstelter    | A first look at last night's #debate ratings... coming up next on @CNN TV with @CarolCNN...                                         |
|  789095747635572736 | 2016-10-20 13:27:41 | realdonaldtrump | Thank you America! #MAGA                   |
|  789088297989640192 | 2016-10-20 12:58:05 | brianstelter    | RT @ExtremeLiberal: Go @brianstelter for going after the "only elites" are concerned about our democratic process. @cnn #cnn        |
{:.table-sql}

### tw_hashtags - Hashtags as extracted from the text of tweet


For example, a tweet with ID `101`, with this text:

> I bought and sold my first #apple computer

Has a corresponding entry in `tw_hashtags`  of:

| tweet_id |   tag   |
|----------|---------|
|      101 | apple   |
{:.table-sql}


(note: a tweet can have more than one hashtag, but that's not important for this section.)

Here's a sample from the table `tw_hashtags:


|      tweet_id      |             tag              |
|--------------------|------------------------------|
| 325013411014520832 | aspen                        |
| 325624214998626305 | regionaldirector             |
| 325624214998626305 | timbayly                     |
| 325624214998626305 | dannythomasmemorialpavillion |
| 326138349939212288 | celebapprentice              |
{:.table-sql}



## Example: Get the 5 hashtags most frequently used in tweets sent on July 2016


Result:

|     tag      | hcount |
|--------------|--------|
| rncincle     |    349 |
| demsinphilly |    167 |
| hannity      |    161 |
| trumppence16 |     83 |
| womenwhowork |     78 |
{:.table-sql}



Query:



~~~sql
SELECT tag, 
   COUNT(*) AS hcount
FROM tw_hashtags
INNER JOIN 
  tweets ON
  tw_hashtags.tweet_ID = tweets.ID
WHERE 
   SUBSTR(time_tweeted, 1, 7) = "2016-07"
GROUP BY tag 
ORDER BY hcount DESC
LIMIT 5;
~~~

(The two following questions are not this difficult; this just is a reminder of all the concepts and where they go)


## Questions


### 1. Count the tweets that mention "vote" somewhere in their text 

(2 points)


|  tcount  |
|----------|
|  3978    |
{:.table-sql}


### 2. For the user named 'realdonaldtrump' list his 5 most used hashtags when tweeting in the hours between midnight and 5 A.M.

(4 points)

Basically, find all tweets by this user in that time period, connect them to their hashtags, then do a group count. All of the components are in in the example.


##### Hints


Hint: Don't forget that we just want it for the user with a screen name of `realdonaldtrump`


Hint: To get a tweet that was posted at midnight, i.e. `00`, you can use `SUBSTR` to extract digits. Or you should just use `STRFTIME`:

~~~sql
SELECT * from tweets 
WHERE 
   STRFTIME("%H", time_tweeted) = "00"
~~~

|  ID                 | Posted at           | Screen name   | Text                                                                                                                                                          |
|---------------------+---------------------+---------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  795430555739373568 | 2016-11-07 00:59:57 | ingrahamangle | Sadly 12,000 ppl were unable to get into the #Minneapolis Event bc fire marshal shut it down! @realDonaldTrump https://t.co/HNr2BTcVJ8                        |
{:.table-sql}

(/end of hints)




The expected result of the query:


|          tag          | hcount |
|-----------------------|--------|
| trump2016             |     94 |
| makeamericagreatagain |     74 |
| bigleaguetruth        |     57 |
| debate                |     45 |
| maga                  |     41 |
{:.table-sql}




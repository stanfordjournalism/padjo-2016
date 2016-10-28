# High-level observations how the web browser interacts with the database


In today's world of interconnectedness, it's actually hard to remember when we used browser bookmarks and kept track of history. Syncing data is built into Google Chrome and Safari offers iCloud, and that's on top of other bookmarking services such as Evernote. Google Search is so good that a lot of people just google for "hotmail" rather than bookmarking hotmail.com


### Those who keep their browser history are doomed to repeat it

https://en.wikipedia.org/wiki/Web_browsing_history


On the other hand, in today's cloud-based information society, it's easy to imagine how a list of websites that you've visited can be a liability. [In the case of People v. Zirko](http://volokh.com/2012/06/07/search-history-as-evidence-in-a-criminal-trial/), prosecutors admitted as evidence the defendant's browser history, arguing that his visits to www.youspystore.com and www.anesthesia-nursing.com/ether was relevant in determining if he was guilty in the murders of his former girlfriend and her mother.

In 2015, The Nation [reported on a case in which a man faced obstruction of justice charges](https://web.archive.org/web/20160310190854/http://www.thenation.com/article/you-can-be-prosecuted-clearing-your-browser-history/) because he cleared his browser history after having volunteered to police what he knew about the suspected Boston Marathon bombers.


For those of you who aren't murderers, there are still plenty of ways for your browser history to negatively impact your life. A reader of the Daily Dot related how they were fired from their internship after a late-night Google search:

> Right out of college, or maybe even my last term, I had an internship at this nonprofit, which was more or less a way for bored housewives to feel like they had jobs (at least while I was there). To say I hated it was an understatement. One morning I came in and was told I was being let go because she'd looked at my browser history the night before and I'd Googled something along the lines ‘fun stuff to eat while you're high.’ I was young... and stupid, because I’d forgotten to clear my history. I was also looking for other jobs, which she saw.

--------

### History. What is it good for?

Doing a search for when browser history was a thing in browsers is very difficult because the vast majority of "browser history" results are questions about how to delete it. 

[Browser-history was a thing by at least 1997](https://www.w3.org/TR/REC-CSS1-961217), when the W3C proposed a style rule that would let web-designers pick a different colors for links that had been visited previously by the user. This style rule, better known to webdevs as `a:visited`, was just a draft, but coming up with it obviously requires the concept of a browser knowing what URLs the user has visited.

For the average user, there was an obvious benefit to this visual flair. If there's a list of links you visit frequently -- say, a Google query for "puppies" -- in which some change while others remain the same, it'd be nice for the _visited_ links to be a different color so that you can focus on the new results. The top link in this link list is a more of a muted purple; the "new" blue links stand out:

<img src="images/google-visited-puppies.jpg" alt="google-visited-puppies.jpg">

It's important to note that the browser has to have the record, or _memory_ of visiting that top-link in order for the browser to then highlight it.

I'm too lazy to look up an old screenshot, but if browsers were tracking history, then there must have been away, as there is today, to visit the list of URLs in the history via a menu item, as there is today.

But definitely by 1999, the thing that
Internet Explorer 5, released in 1999 https://support.microsoft.com/EN-US/kb/217148

history explorer: https://support.microsoft.com/en-us/kb/221787










--------------------------



What if the webpage owner were to become naughty





 tracking user history, because..






According to release notes of Internet Explorer 5, https://support.microsoft.com/en-us/kb/221787





Auto-completion of URLs was in Google Chrome -- now the most popular web browser -- in the very first version when Chrome launched in September 2008.




The dates below are just estimates


I do think that browser

-----------------

#### Autocompletion of URLs

http://lifehacker.com/313533/enable-firefox-address-bar-auto-completion

I don't think Google Chrome, when it was released in September 2008, was the first browser to have this feature.

By Decmeber of that same year, a Chrome user was already asking, [
how in God's name can I disable autocomplete?](https://productforums.google.com/forum/#!topic/chrome/0DR-pLIVI5g)


Modern browsers allow the user to disable history tracking. But this feature is turned on by default, which means the vast majority of Internet users, knowingly or not, are letting their browsers track every website they ever visit. 


#### Revisiting URLs with bookmarks

In the early days of web browsers -- think early or even pre-Google -- URLs were just as hard to remember as they are today:

`http://www.angelfire.com/electronic/overhere/comedy/yourbase.html`

If [you wanted to re-experience "All Your Base"](http://www.angelfire.com/electronic/overhere/comedy/yourbase.html), you had to explicitly tell your browser to "bookmark" the URL. Bookmarking made it so you didn't have to remember the exact URL, but you still had to search through your bookmarks to revisit their respective websites.

Bookmarking is such an _intentional_ task that if you even still use them, you probably shouldn't be surprised at what you'd find in your list of bookmarks.


Contrast that to browser history and __cache__. My Google-fu is failing me when searching for the "history of browser history".



https://developer.mozilla.org/en-US/docs/Web/CSS/Privacy_and_the_:visited_selector






By post [you can easily find "All Your Base"](http://lmgtfy.com/?q=all+your+base) if you can remember the "all your base" part and how to do a Google query. Today, Google is so fast, and so seamlessly built-into the browser experience that 


Google is so fast, and its queries are seamlessly executed in the address bar, where users used to have to type in URLS by hand, [that bookmarks were considered old-fashioned years ago](http://lifehacker.com/390222/do-you-still-use-browser-bookmarks).










that by 2008, Lifehacker was asking its users if they [were still using old fashioned browser bookmarks]().








Before so much of our data was stored in the cloud



What features of tracking web history make the case of enabling it by default? For starters, today, your web activity is being tracked constantly by online services. If Google Chrome is your main web browser, and/or you are searching for incriminating things via Google, police don't need access to your computer and its files, they will just subpoena Google: [Google discloses the frequency of data requests in its transparency reports](https://www.google.com/transparencyreport/userdatarequests/?hl=en).


Google uses the [data of your past search history](https://support.google.com/websearch/answer/6068625?hl=en  
) to inform everything from its autocomplete to its newest [artificial-intelligence-powered bots](https://assistant.google.com). When I used Google Chrome's search-by-voice feature, logged in as myself, and asked "Can I buy pythons", it interpreted my words as"Time by pythons" -- because of all many, many times I have to lookup how to handle datetime values in the Python programming language, compared to the roughly 0 times I've ever wanted to buy an *actual* python of the slithering value.

When I asked by voice using an anonymized browser, it heard "Can I buy python" and directed me to several links that asked that same question.

But Google doesn't just save this search data in the browser. If you are logged into your Google account -- which you probably are if, when visiting `www.gmail.com`, you see your inbox and not a login screen -- the record of my interest in buying/time Pythons goes to Google's cloud servers.

It's no secret Google analyzes search data to boost its algorithms and bottom line, so it needs that data on its own servers, not just your hard drive. But there's still benefit for you if you're a modern web user. Because you now likely do most of your web searching on your smart phone. And you might find it inconvenient that  

the modern web-browsing user because



https://support.google.com/websearch/answer/6068625?hl=en  

search data it has on you to help inform

https://support.google.com/websearch/answer/6068625?hl=en


Think back to the old days, when 

Users often visit


But for the most part, modern browsers



That said, if you'

And your privacy can be compromised even by someone (or rather, a computer server) across the world with no access to your computer or its files. Have you ever noticed how visiting a 

And in the endless chronicles of How Metadata can Ruin Your Life, even when you *do* go out of your way to 





-------------------


Here's an infamous bug report for Firefox back 

https://www.schneier.com/blog/archives/2006/03/mozilla_bug_cau.html


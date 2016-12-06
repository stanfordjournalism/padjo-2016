rm -f midterm-datasets.sqlite
ls *.csv | while read -r fname; do
    bname=$(echo $fname | ack -o '^\w+')
    echo $bname
    csvformat -U 1 "$fname" | csvsql --db sqlite:///midterm-datasets.sqlite \
        --insert --tables $bname
done


echo '
update tweets set "Screen name" = LOWER("Screen name");
update tw_users set "Screen name" = LOWER("Screen name");
update tw_users set "Screen name" = LOWER("Screen name");


CREATE INDEX congress_legislators_on_bioguide_id ON congress_legislators(bioguide_id);
CREATE INDEX congress_legislators_on_birthdate ON congress_legislators(birthdate);
CREATE INDEX congress_legislators_on_last_name ON congress_legislators(last_name);
CREATE INDEX congress_legislators_on_state ON congress_legislators(state);

CREATE INDEX congress_terms_on_bioguide_id ON congress_terms(bioguide_id);
CREATE INDEX congress_terms_on_state ON congress_terms(state);
CREATE INDEX congress_terms_on_end_date ON congress_terms(start_date);
CREATE INDEX congress_terms_on_start_date ON congress_terms(end_date);

CREATE INDEX tw_hashtags_on_tweet_id ON tw_hashtags(tweet_id);
CREATE INDEX tw_hashtags_on_hashtag ON tw_hashtags(hashtag);
CREATE INDEX tw_mentions_on_tweet_id ON tw_mentions(tweet_id);
CREATE INDEX tw_mentions_on_hashtag ON tw_mentions(mentioned);
CREATE INDEX tweets_on_id tweets(ID);
CREATE INDEX tweets_on_posted_at ON tweets("Posted at");
CREATE INDEX tweets_on_screen_name ON tweets("Screen name");
CREATE INDEX tweets_on_text ON tweets(LOWER(Text));
' | sqlite3  midterm-datasets.sqlite

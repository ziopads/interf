import twitter4j.util.*;
import twitter4j.*;
import twitter4j.management.*;
import twitter4j.api.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.auth.*;
 
TwitterStream twitterStream;
 
void openTwitterStream() {  
 
  // OAuth references config file
  ConfigurationBuilder cb = new ConfigurationBuilder();  
  cb.setOAuthConsumerKey(consumerKey);
  cb.setOAuthConsumerSecret(consumerSecret);
  cb.setOAuthAccessToken(accessToken);
  cb.setOAuthAccessTokenSecret(accessTokenSecret); 
 
  TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
 
  FilterQuery filtered = new FilterQuery();
 
  String keywords[] = {
    "kitty"
  };
 
  filtered.track(keywords);
 
  twitterStream.addListener(listener);
 
  if (keywords.length==0) {
    twitterStream.sample();
  } else { 
    twitterStream.filter(filtered);
  }
  println("connected");
} 
 
StatusListener listener = new StatusListener() {
 
  //@Override
  public void onStatus(Status status) {
    tweet = status.getText();
    //System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
    System.out.println("@" + tweet);
  }
 
  //@Override
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
 
  //@Override
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
 
  //@Override
  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
 
  //@Override
  public void onStallWarning(StallWarning warning) {
    System.out.println("Got stall warning:" + warning);
  }
 
  //@Override
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};
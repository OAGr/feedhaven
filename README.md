# Feedhaven.  Liberate your data.
Most online data is behind the walls of big applications that don't play
well with others.  Use Feedhaven to take your data and store it in a way
that's completely accessible to you  
![revolution](doc/images/revolution_wide.png)
## What is Feedhaven?

Feedhaven is a platform for storing and editing data in a generalized feed format.  Feedhaven is meant to be used in combination with other tools to import and export data from other applicaitons.  We suggest that you use Feedhaven to store most data that you care about on the internet, in order to keep forever and use easily for any purpose you choose.  
  
Feedhaven is currently in development mode and has not yet reached
alpha.  We encourage you to take a look, but keep in mind that the
codebase is lacking in tests and polish.


### Recommended feeds to import to Feedhaven
* Emails
* RSS Feeds
* Social Feeds (Facebook, Twitter, LinkedIn)
* Rescuetime data
* SMSs
* Chat messanges

### Feedhaven feeds export directly to
* ATOM
* JSON

## Feedhaven data structure
The main structure of Feedhaven encompasses feeds and entries.  One feed has many entries, and each entry belongs to one feed.  All data is stored on MongoDB.

### Feed
{ id (generated) : The unique identifier for the object  
  Title (required) : The title of the feed  
  Subtitle : Extra information about the feed  
  Source : A link of the website where the content is pulled from. In the case where this is ambiguous, please provide a description  
  Rights : The rights pertaining the public permission to use contents of this feed 
  Tags : Tags for the feed  
  Categories : Categories hash  
  Icon : A URL to a picture used to describe this feed. The picture should be at least 100x100px, preferable square  
  Updated (not editable) : Most recent time when a feed collection / entry was edited, added, or deleted  
  Updated_at (Not editable) : Most recent time when the feed element itself was edited or created  
  Created_at (Not Editable) : The time when the feed element was created  
  Dump : A hash for any additional key values  
  author :  
            { name : Author Name  
              email : Author Email  
              uri : Author Uri  
              }  
}

### Entry
{ id (generated) : The unique identifier for the object  
  Title (required) : The title of the feed  
  Summary : Extra information about the feed  
  Link : A revelant link or link to the original content  
  Published : The time the entry was published  
  Updated : The time the entry was most recently edited  
  Dump : A hash with any additional key values  
  author :  
            { name : Author Name (if different from feed)   
              email : Author Email (if different from feed)  
              uri : Author Uri (if different from feed)  
              }  
}
  
## Getting Started
Feedhaven was made to work easily with Heroku.  It does requre a MongoDB
database.  We recommend MongoHQ or Mongolab to assist with providing a
hosted MongoDB database.  Both provide free storage for up to 500MB of
data.

### MongoDB with MongoHQ
If you sign up for MongoHQ with heroku, linking them is easy.  Just set the relevent ENV to
the uri mongodb://{username}:{password}@linus.mongohq.com:{port}/app{app
ID}

## Project Status
Feedhaven is still in early development.  We expect to reach alpha in the next
few weeks.  So far the code is functional for importing, holding, and
accessing data.  However, there are still no tests, no user
administration, and no data security layers.  Consider the project very
early stage.

### Hosted Version
We are working to provide a paid hosted version directly through
FeedHaven shortly.

## License
Feedhaven is provided under the MIT License.

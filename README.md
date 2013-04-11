# Feedhaven.  Liberate your data.

## What is Feedhaven?

Feedhaven is a platform for storing and editing data in a generalized feed format.  Feedhaven is meant to be used in combination with other tools to import and export data from other applicaitons.  We suggest that you use Feedhaven to store most data that you care about on the internet, in order to keep forever and use easily for any purpose you choose.

## Recommended feeds to import to Feedhaven
* Emails
* RSS Feeds
* Social Feeds (Facebook, Twitter, LinkedIn)
* Rescuetime data
* SMSs
* Chat messanges

## Feedhaven feeds export directly to
* ATOM
* JSON

## Feedhaven data structure
The main structure of Feedhaven encompasses feeds and entries.  One feed has many entries, and each entry belongs to one feed.  All data is stored on MongoDB.

### Feed
{ id (generated) : The unique identifier for the object
  Title (required) : The title of the feed
  Subtitle : Extra information about the feed
  Source : A link of the website where the content is pulled from. In the case where this is ambiguous, please provide a description.
  Rights : The rights pertaining the public permission to use contents of this feed
  Tags : Tags for the feed
  Categories : Categories hash
  Icon : A URL to a picture used to describe this feed. The picture should be at least 100x100px, preferable square
  Updated (not editable) : Most recent time when a feed collection / entry was edited, added, or deleted
  Updated_at (Not editable) : Most recent time when the feed element itself was edited or created
  Created_at (Not Editable) : The time when the feed element was created
  Dump : A hash for any additional key values.
}

### Entry Class
{ id (generated) : The unique identifier for the object
  Title (required) : The title of the feed
  Summary : Extra information about the feed
  Link : A revelant link or link to the original content
  Published : The time the entry was published
  Updated : The time the entry was most recently edited
  Dump : A hash with any additional key values
  author :
            { name : Author Name
              email : Author Email
              uri : Author Uri
              }
}
  
## License
Feedhaven is provided under the MIT License.

Cascade Server Example Sites
============================

Example Sites for importing into Cascade Server instances.

List of example Sites with descriptions:

Basic-Site - This Site is meant to be a very basic started for building out a brand new Site from scratch.<br />
https://github.com/hannonhill/Cascade-Server-Example-Sites/raw/master/Basic-Site.csse

It contains:

* An example Page Asset Factory (by virtue also includes base asset, Content Type, Configuration Set, Data Definition, and Metadata Set).
* Two example Templates (one for xml and one to be updated with your XHTML).
* Example Index Blocks for a variety of cases (calling page, current folder, root going forward 2 levels, etc).
* An example folder structure for categorizing and storing non-published assets.

Blog - This Site is an example of blogging in Cascade Server. It is the actual example talked about in [this blog post](http://www.hannonhill.com/news/blog/2012/blogging-with-cascade-server.html) and demonstrated in [this webinar](http://www.hannonhill.com/products/demos/setting-up-blogging-in-cascade-webinar-form.html).

It contains:

* Landing Page for aggregation of all recent posts.
* Taxonomy Pages for 7 pre-built Categories.
* Folders for yearly and monthly organization of Blog Posts.
* Examples for both Javascript-driven and Web Services comment functionality.

*To utilize web services instead of Javascript (via Disqus), edit the "Blog Post" Configuration Set and the "Page Comments" region. Switch the block to `/_cascade/blocks/index/comments` and pair it with the `/_cascade/formats/post-comments` Format.*
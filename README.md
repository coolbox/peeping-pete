# Peeping Pete Scripts
Some scripts to practice my CasperJS with.

## Requirements
[http://casperjs.org/](http://casperjs.org/)

> CasperJS is an open source navigation scripting & testing utility written in Javascript for the PhantomJS WebKit headless browser and SlimerJS (Gecko). It eases the process of defining a full navigation scenario and provides useful high-level functions, methods & syntactic sugar for doing common tasks such as:
> 
> - defining & ordering browsing navigation steps  
> - filling & submitting forms  
> - clicking & following links  
> - capturing screenshots of a page (or part of it)  
> - testing remote DOM  
> - logging events  
> - downloading resources, including binary ones  
> - writing functional test suites, saving results as JUnit XML
scraping Web contents  

## Usernames and Passwords
On each script you will find: `** YOUR EMAIL **` and `'**YOUR PASSWORD**'`, each of which needs to be changed to your credentials for login.

**Never commit these credentials to Github!**

## LinkedIn
In this repo is a folder of LinkedIn related scripts.

**Script 1:**  
- Open LinkedIn  
- Login  
- Open every profile on your dashboard  

**Script 2:**  
- Open LinkedIn  
- Login  
- Do an advanced search for each keyword specified, for "2nd connections"  
- Open the profile of everyone on the page  
- Grab all the pagination links  
- Open each results page  
- Open the profile of everyone on the page  

## Rate Limits
Go in too hard and LinkedIn will stop your access to the web platform.

Run Script 2 too regularly and you will use up your free amount of advanced searches. The outcome of this is that there is only one page of profiles to open - no paginated results. The script will continue however.
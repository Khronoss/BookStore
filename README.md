# BookStore
A little Book store app as a test. It's targeting to use Core Data, Overcoat (for REST calls and object mappings), and some other funny stuff to work on like CollectionViews and so on

## Installation
1. clone the repository
2. run 'pod install'
3. that's it ! \o/

## Technical choises
In this app, I've been trough some choises to give the user what I think to be the best experience for a mobile app:

- an easy yet comprehensive UI
- an offline mode so that he can the app even without an internet connection

To acomplish that, I decided to use some external libraries:

- Overcoat
- SDWebImage

### Why Overcoat ?
- easy to use/setup (...I didn't though it was possible to have a 'first try' code working :o)
- using AFNetworking 2.5 (while Restkit is using 1.5)
- using Mantle for persistence

### Why SDWebImage ?
- Add caching logic for downloaded images with optional placeholder while loading

# Cacira Cache

Cache library in Swift for iOS using NSUserDefaults.

## Installation

Just drag and drop the two `.swift` files into your project.

## Usage

```swift
// Save to cache
let obj1 = CACacheObject(content: JSON)
CACache.setObject(obj1, forKey: "myObject")

// Retrieve from cache
let obj2 = CACache.getObject(fromKey: "myObject")

// Retrieve from cache with a max cache age (NSTimeInterval)
let obj2 = CACache.getObject(fromKey: "myObject", withMaxCacheAge: 2*60*60) // 2h
```

## Contributing

* Create something great, make the code better, add some functionality,
  whatever (this is the hardest part).
* [Fork it](http://help.github.com/forking/)
* Create new branch to make your changes
* Commit all your changes to your branch
* Submit a [pull request](http://help.github.com/pull-requests/)

## Contact

Feel free to get in touch.

* Website: <http://cacira.com> <http://cetorres.com>
* Twitter: [@cetorres](http://twitter.com/cetorres)

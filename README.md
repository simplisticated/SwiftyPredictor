<p align="center" >
  <img src="https://github.com/igormatyushkin014/SwiftyPredictor/raw/master/Images/logo_500_500.png" alt="SwiftyPredictor" title="SwiftyPredictor">
</p>

<p align="center">
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat"></a>
  <a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/SwiftyPredictor.svg?maxAge=2592000"></a>
  <a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/SwiftyPredictor.svg?maxAge=2592000"></a>
  <a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# At a Glance

`SwiftyPredictor` simplifies work with [Yandex.Predictor](https://tech.yandex.ru/predictor) service in iOS.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `SwiftyPredictor` cocoapod.

## Requirements

* iOS 9.0 and later
* Xcode 8 and later

## Usage

To initialize predictor, simply write something like this:

```swift
let predictor = Predictor(APIKey: "some_api_key")
```

As you noticed, constructor requires API key. If you still don't have it, obtain new API key [here](https://tech.yandex.ru/keys/get/?service=pdct) (you'll need to authorize with Yandex account).

Now you can make requests for text suggestions:

```swift
predictor.requestSuggestions(forQuery: "how to ", inLanguage: .english, withLimit: 10) { (suggestions, error) in
    for suggestion in suggestions {
        print(suggestion.text)
    }
    
    if error != nil {
        print("Error: \(error!)")
    }
}
```

The example above will print suggestions for phrase `how to `:
- `get`
- `make`
- `use`
- `buy`
- `do`

You can change language by its identifier or predefined name:
- `.english`
- `.russian`
- `.custom(identifier: "es")` - Spanish language
- etc.

If you want to receive full list of supported languages, use `availableLanguages` method:

```swift
predictor.availableLanguages { (languages, error) in
    for language in languages {
        print(language.identifier)
    }
}
```

## License

`SwiftyPredictor` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

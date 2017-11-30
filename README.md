# ScreenSaverTemplate

## Overview

**ScreenSaverTemplate** is a MacOS screen saver written in objective-c.  The example HTML content is based upon octoscreen, referenced in the [acknowledgements](#acknowledgements) section below.  This screen saver template provides the following features:

- Sample HTML based screen saver
- Sample preferences screen for screen saver
- Screen saver preview during development utilizing runner target

## Customizing

Replace the instance of "newScreenSaverName" in the first line below with your desired project name.

```sh
$ export newScreenSaverName="Custom ScreenSaver"
$ export newScreenSaverNameClass="${newScreenSaverName//[[:blank:]]/}"
$ git clone https://github.com/burnsra/ScreenSaverTemplate.git "$newScreenSaverName"
$ cd "$newScreenSaverName"
$ find . -path "*.git*" -prune -o -not -name "*.png" -type f -print0 | xargs -0 sed -i "" "s/ScreenSaverTemplate/$newScreenSaverNameClass/g"
$ find . -path "*.git*" -prune -o -not -name "*.png" -type f -print0 | xargs -0 sed -i "" "s/ScreenSaver Template/$newScreenSaverName/g"
$ find . -type d -name "ScreenSaverTemplate*" | sed -e "p;s/ScreenSaverTemplate/$newScreenSaverNameClass/g" | xargs -n2 git mv
$ find . -type f -name "ScreenSaverTemplate*" | sed -e "p;s/ScreenSaverTemplate/$newScreenSaverNameClass/g" | xargs -n2 git mv
$ git add -A
$ git commit -m "Renamed template screen saver project to "$newScreenSaverName
$ unset newScreenSaverName
```

## Acknowledgements

- [octoscreen](https://github.com/orderedlist/octoscreen/) by [Steve Smith (orderedlist)](steve@github.com)

## Contributions

Do you want to improve the app or add any useful features? Please go ahead and create pull requests. I'm thankful for any help.

## License

[MIT](https://github.com/burnsra/ScreenSaverTemplate/blob/master/LICENSE) © Robert Burns

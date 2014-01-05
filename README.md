# [Middleman Slim Blog](https://github.com/ptb/middleman-slim-blog) #

**Middleman Slim Blog** is blog template for the a static site generator [Middleman](http://middlemanapp.com/). This template uses [valid](http://validator.w3.org/) [HTML5](http://www.w3.org/TR/html5/) and markedup using the [schema.org](http://schema.org/) [microdata](http://dev.w3.org/html5/md/) and [microformats](http://microformats.org/) vocabularies. [Slim](http://slim-lang.com/) and [Sass](http://sass-lang.com/) were chosen for clean structured output with an absolute minimum of typing. Blog articles and topic pages (tags) can have introductory content. Generated URLs are [short](http://www.seomoz.org/blog/11-best-practices-for-urls) and [clean](http://warpspire.com/posts/url-design/). Generated content is compact and thus quick to load. It includes a minimum of styling, but it does include an adaptation of the Bootstrap 3.0 grid. The workflow for site development is designed to be easy and dynamic: hit save and the site is automatically reloaded in your browser. Because the generated output is static content, it can be hosted on any web server, even [Amazon S3](http://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html) at your [root domain](http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html). If you use Amazon S3 for hosting, I highly recommend using [Panic Transmit](http://panic.com/transmit/). I've included a script to set the correct headers in `scripts/set-s3-headers.command` for gzipped content. This template is [Apache-licensed](http://www.apache.org/licenses/LICENSE-2.0.html).

## Setup ##

This is how I set up a [new Mac](http://store.apple.com/us/browse/home/shop_mac) running [OS X Mavericks](http://www.apple.com/osx/) to make use of this template.

### Install [Command Line Tools](https://developer.apple.com/downloads/) for Xcode ###

An [Apple Developer account](https://developer.apple.com/programs/register/) is required to download the [Xcode](https://developer.apple.com/xcode/) [Command Line Tools](https://developer.apple.com/downloads/).

Download the latest version of the [Command Line Tools for Xcode](https://developer.apple.com/downloads/).

![Command Line Tools (OS X Mavericks) for Xcode - Late October 2013](http://i.imgur.com/jkI56Hj.png)

Install the [Command Line Tools](https://developer.apple.com/downloads/).

![Install Command Line Tools (Mountain Lion)](http://i.imgur.com/5uApa.png)

### Launch [Terminal](file:///Applications/Utilities/Terminal.app) ###

Launch [Terminal](file:///Applications/Utilities/Terminal.app) and copy and paste each block of the following code into the Terminal window.

### Edit [/etc/paths](file:///etc/paths) ###

Edit the file **/etc/paths** so that **/usr/local/bin** is listed first.

```bash
/usr/bin/sudo /bin/cat /etc/paths;
```

You may be prompted to enter your password.

```bash
/usr/bin/sudo /bin/sh -c "/usr/bin/grep -v '^/usr/local/bin$' /etc/paths > /etc/paths.1";
/usr/bin/sudo /bin/sh -c "/bin/cat - /etc/paths.1 <<< '/usr/local/bin' > /etc/paths.2";
/usr/bin/sudo /bin/rm /etc/paths.1;
/usr/bin/sudo /bin/mv /etc/paths.2 /etc/paths;
/bin/cat /etc/paths;
```

Close and re-open the Terminal window to complete these changes.

### Install [Homebrew](http://brew.sh/) ###

```bash
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
```

When prompted, press the 'ENTER' key to continue.

```bash
brew doctor;
brew update;
brew install git readline sqlite;
```

### Install [RVM](https://rvm.io/rvm/install/) ###

```bash
curl -sSL https://get.rvm.io | bash -s stable --autolibs=homebrew;
```

```bash
source $HOME/.rvm/scripts/rvm;
```

### Install [Ruby](http://www.ruby-lang.org/en/) ###

```bash
brew install libgpg-error libksba;
brew tap homebrew/dupes;
brew install autoconf automake apple-gcc42;
brew install libtool pkg-config libyaml openssl;
```

```bash
rvm reinstall all --force;
echo 'install: --no-rdoc --no-ri' >> ~/.gemrc;
echo 'update: --no-rdoc --no-ri' >> ~/.gemrc;
rvm install 2.1.0;
```

Press the 'q' key, to dismiss the instructions and to continue.

```bash
rvm use 2.1.0 --default;
ruby -v;
```

### Clone this repository ###

```bash
/bin/mkdir -p ~/Sites/example.com/;
cd ~/Sites/example.com/;
git clone https://github.com/ptb/middleman-slim-blog .;
```

```bash
bundle install;
```

### Getting Started ###

To get started, first edit the `data/authors.yml` file. This populates your information throughout your site. You'll want to replace the content in the `source/content` and `intros` folders with your own.

To create a new article:

```bash
cd ~/Sites/example.com/;
./scripts/3-create-article.command;
```

## Usage ##

```bash
cd ~/Sites/example.com/;
./scripts/1-start-server.command;
```

Open this link: [http://localhost:5001/](http://localhost:5001/)

### Deploy ###

First build your site:

```bash
cd ~/Sites/example.com/;
./scripts/4-build-site.command;
```

If you don't want to serve gzipped content, skip the next two steps.
To upload pre-gzipped content to S3, set the correct upload headers in Transmit first (only once). Make sure Transmit is not running, then:

```bash
cd ~/Sites/example.com/;
./scripts/set-s3-headers.command;
```

```bash
cd ~/Sites/example.com/;
./scripts/5-force-gzip.command;
```

Then with Transmit sync your build folder with your Amazon S3 bucket.

## License ##

Copyright 2014, Peter T. Bosse II ([ptb@ioutime.com](mailto:ptb@ioutime.com))

Licensed under the Apache License, Version 2.0 (the 'License');
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an 'AS IS' BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

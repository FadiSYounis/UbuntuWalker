# Ubuntu Walker

Ubuntu Walker is a Ruby script that mines the Linux operating system source code archives and extracts source code files. 

This script was used to generate the LSC (Linux-Source-Code) Machine Learning Dataset. 

Further information on the dataset contents and conversion process can be found in the paper available at

### Don't want to run our script, and just want the dataset?
The full dataset, is available from (www.google.com)

### what does it do
* Extracts source code files from .tar archive files in the Linux operating system. tar archives supported are .bz2, .xz, .gz
* classifies the extracted files depending on file extension and stores them in corresponding folder
* Currently classified file types supported are: Java, C, C++, Ruby, Python, JavaScript

### Dataset Summary 
There are six different source code folders generated from this script, A short summary of the dataset is provided below:
* Java Source Code folder - contains 1 source code files.   
* C Source Code folder - contains 1 source code files. 
* C++ Source Code folder - contains 1 source code files. 
* Ruby Source Code folder - contains 1 source code files. 
* Python Source Code folder - contains 1 source code files. 
* JavaScript  Source Code folder - contains 1 source code files. 

Please refer to the dataset [ ] for more details. 
### Getting Started

These instructions will get generate a copy of the dataset on your local machine for development and testing purposes. See below for details on how to run:

### Installation

clone this repository:
```
Give examples
```

### Running using Docker 

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

## Deployment

David add this

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Ruby version 2.0.0-p648
* [RVM](https://rvm.io/) - Ruby Version Manager 
* [Docker](https://www.docker.com/) - Docker for Deployment
* [Bundler](http://bundler.io/) - Bundler for Managing Ruby Gems
* [Redis](https://redis.io/) - File queuing 
* [kubernetes](https://kubernetes.io/) - Deployment, Scaling and Management


## Ruby Gems used
* [trollop](https://rubygems.org/gems/trollop/versions/2.1.2) - 2.1.2  
* [redis](https://rubygems.org/gems/redis/versions/3.3.5) - 3.3.5
* [ruby-filemagic](https://rubygems.org/gems/ruby-filemagic/versions/0.7.2) - 0.7.2
* [ruby-xz](https://rubygems.org/gems/ruby-xz/versions/0.2.3) - 0.2.3
* [rbzip2](https://rubygems.org/gems/rbzip2/versions/0.3.0) - 0.3.0
* [rubysl-zlib](https://rubygems.org/gems/rubysl-zlib/versions/2.0.1) - 2.0.1

## Contributing
Please read [CONTRIBUTING.md]() for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Github](https://github.com/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Fadi Younis** - [fyounis@ryerson.ca](fyounis@ryerson.ca)
* **David Tenty** - [dtenty@ryerson.ca](dtenty@ryerson.ca)
* The iCaSL Information and Computer Security Lab
Ryerson University
Toronto, Ontario 

## How to cite
* Please cite the following paper when using or referencing the dataset:

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details,

## Acknowledgments

* Ubuntu Community for allowing us access to their archived source code.



## Motivation
Ubuntu Walker is a program that takes the Linux operating system source code as an input parameter. The Ubuntu archives are then mined and the source code files are extracted. This script was used to generate the LSC (Linux-Source-Code) Machine Learning Dataset.  The main reason for building this program was was ability to quickly generate a dataset for source-code classifiers. 

🚧 Do not bother running if you don't have a GPU. The dataset is completely safe to use. 

## Don't want to run our script, and just want the dataset? 
The full dataset, is available from (https://drive.google.com/open?id=1YGA1EytPcmc84yfYABdInMXsLBoz82M4).

## What does it do
* Extracts source code files from .tar archive files in the Linux operating system. tar archives supported are .bz2, .xz, .gz
* Classifies the extracted files depending on file extension and stores them in corresponding folder.
* Currently classified file types supported are: Java, C, C++, Ruby, Python, JavaScript.

## Dataset Summary 
There are six different source code folders generated from this script, A short summary of the dataset is provided below:
* Java Source Code folder - contains 1 source code files.   
* C Source Code folder - contains 1 source code files. 
* C++ Source Code folder - contains 1 source code files. 
* Ruby Source Code folder - contains 1 source code files. 
* Python Source Code folder - contains 1 source code files. 
* JavaScript  Source Code folder - contains 1 source code files. 

Please refer to the dataset (https://drive.google.com/open?id=1YGA1EytPcmc84yfYABdInMXsLBoz82M4) for more details. 

## Classes and Methods
#  FileWalker Class
| Method        | Functionality
| :------------ |:---------------:|
| col 3 is      | some wordy text |
| col 2 is      | centered        |
| zebra stripes | are neat        |

#  Information_Runner Class
| Method        | Functionality
| :------------ |:---------------:|
| col 3 is      | some wordy text |
| col 2 is      | centered        |
| zebra stripes | are neat        |

#  ListRun Class
| Method        | Functionality
| :------------ |:---------------:|
| info_run      | some wordy text |


#  ListRun Class
| Method        | Functionality
| :------------ |:---------------:|
| run     | some wordy text |

#  Runner Class
| Method        | Functionality
| :------------ |:---------------:|
| initialize    | some wordy text |


#  TarWalker Class
| Method        | Functionality
| :------------ |:---------------:|
| tarEntryProcessor| extracts the source code files from the archive source, checks the file extension and places the file in the respective destination folder|
| pathCreator   | due to sheer number of files, there might be collision. This method generates a SHA256 random number and assigns it to the file      |
| tar_reader    | reads in the archive compression coming in from the .gz, .bz2, .bz compression streams
| tarExtractor | assigns the archive to the stream, based on its on extension (.gz, .bz2, .bz) |

## Getting Started

These instructions will generate a copy of the dataset on your local machine for development and testing purposes. See below for details on how to run:

## Installation

clone this repository:
```
git clone https://github.com/FadiSYounis/UbuntuWalker
```
Run Make File:
```
docker build -t [/path/to/ubuclass] -f Dockerfile.master src/
```
Running in Kubernetes:
```
kubectl create -f ./job.yaml
```
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



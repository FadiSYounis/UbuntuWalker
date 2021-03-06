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
* Java Source Code folder - contains 748370 source code files, avg. file size 8.6 KB, max-file size is 5.7 MB, max-file line count is 159251.   
* C Source Code folder - contains 1459287 source code files, avg. file size 24 KB,  max-file size is 30 KB,  max-file line count is. 
* C++ Source Code folder - contains 1392715 source code files, avg. file size 17 KB,  max-file size is 30 KB  max-file line count is 422855 . 
* Ruby Source Code folder - contains 175338 source code files, avg. file size is 4.6 KB, max-file size is 3 KB,  max-file line count is 79525. 
* Python Source Code folder - contains 666157 source code files, avg. file size is 12.6 KB,  max-file size is 15.6 KB,  min-file line count is 238295 . 

Please refer to the COMMANDS file above for more statistical information.  

## Classes and Methods
#  FileWalker Class
| Method        | Functionality
| :------------ |:---------------:|
| initialize   | eestalishes a connection to the generated datasets to perform statistical operations on the files |
| FileInfoExtractor     | gets size and line of code from each file in each destination folder and stores them in a SQL server |
| folder_processor |    runs file info extractor for each file in the destination folder     |

#  ListRun Class
| Method        | Functionality
| :------------ |:---------------:|
| info_run      | reads the code files the untard files and places them in a new redis queue, pops the files off the qeueu and extracts the source code from each file. |

#  Runner Class
| Method        | Functionality
| :------------ |:---------------:|
| initialize    | creates a new redis queue, and creates destinations folders for the source code files and extract the tar archives |
#  TarWalker Class
| Method        | Functionality
| :------------ |:---------------:|
| tarEntryProcessor| extracts the source-code files from the archive sources, checks the file extension and places the file in the respective destination folder (C, C++, Java, Python, Ruby)|
| pathCreator   | due to sheer number of files, there might be a name collision. This method generates a SHA256 random number and adds it to the file name      |
| tar_reader    | reads in the compressed archive folders coming in from the .gz, .bz2, .bz compression streams
| tarExtractor | assigns the archive to the a decompression stream, based on its on extension (.gz, .bz2, .bz) |

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



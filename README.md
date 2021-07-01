# LexiCon

A brain computer interface designed to revolutionize the way we interact with our machines.
It makes use of the latest developments in technology to turn your thought into action.

# Paper

## Abstract

Recent developments in technology has enabled us to interact with our machines in novel ways - touch interaction in smartphones, voice recognition in home assistants like Alexa and biometrics using fingerprint scanners. These developments seemed no more than science fiction a few decades ago, and so did an interface linking human thoughts to commands on a computer. Brain-Computer Interface (BCI) is a technology with a variety of applications from medicine to gaming. 

This project makes use of a low cost and commercially available BCI devices to create a product demonstrating the applications of a BCI system. EEG Hardware is used to extract electroencephalography (EEG) signals non-invasively from a user. The signals are then processed and Machine Learning techniques are used to map the signals to left and right commands. The best performing model uses 6 temporal and spatial filters with LDA as the classification algorithm. The commands are then used to control a simple game to demonstrate the power of the BCI system.

## Read the Final Paper here
https://github.com/krohak/LexiCon/blob/master/3035242475_SDP_REPORTl.pdf


# Demos

## [Testing](https://drive.google.com/file/d/10kiF07WuiZhHwe1b2Yuiy4SUnI7Ru2eq/view?usp=sharing)
[<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/Screenshot%202021-07-01%20at%203.40.40%20PM.png'>](https://drive.google.com/file/d/10kiF07WuiZhHwe1b2Yuiy4SUnI7Ru2eq/view?usp=sharing)

## [Game Control](https://drive.google.com/file/d/1-a7NTX9laiM_SheUz6Q5CABLMDZ3yie8/view?usp=sharing)
[<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/Screenshot%202021-07-01%20at%203.40.47%20PM.png'>](https://drive.google.com/file/d/1-a7NTX9laiM_SheUz6Q5CABLMDZ3yie8/view?usp=sharing)

# Methodology

## Electrodes Setup
<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/Screenshot%202021-07-01%20at%203.47.13%20PM.png'>

## Motion Imagery
<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/Screenshot%202021-07-01%20at%203.48.11%20PM.png'>

## Capturing EEG Data 
<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/openbci-daisy.PNG'>

## OpenVibe
<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/15-03-accuracy.PNG'>

## Varied Signal Processing Architectures
In an aim to increase the training and testing accuracies of the system, the team developed 2 Signal Processing Architectures / Pipelines. For the training of the CSP filter and classifier weights, we utilized more than a single temporal filter with an aim to increase the classification accuracy of the signal. This technique called FBCSP aims to extract CSP features which are specific to a given frequency band.

<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/Screenshot%202021-07-01%20at%203.58.04%20PM.png'>

Figure shows the Alpha and Beta band separated version of the architecture shown in Figure 3-14. Two temporal filters are used, one for choosing the EEG activities in the Alpha range (8-12Hz) and the other in the Beta range (12-38Hz). Since a single CSP filter is trained for each Temporal Filter, two sets of CSP filters weights are trained, with an output of 6 features each.

<img src='https://raw.githubusercontent.com/krohak/LexiCon/master/Screenshot%202021-07-01%20at%203.58.09%20PM.png'>

Figure shows the the Alpha and Beta band separated version of the architecture shown in previous figure. The two CSP filters are used to obtain features which are then separated on the basis of the left and right trails. A single classifier is then trained after the left and the right features are aggregated from both the CSP spatial filters.

# Webiste
https://i.cs.hku.hk/fyp/2018/fyp18069/

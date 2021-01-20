---
title: "README"
author: "Kenneth Day"
date: "January 19, 2021"
output: html_document
---


## Purpose of "run_analysis.r"

The purpose of the "run_analysis.r" script is to produce a data table that shows the average of the different variables containing mean and standard deviation for each grouping of activity and subject.

## Explanation of "run_analysis.r"

The script starts by loading in the test and train data measurements as well as the list of features. It also loads the tables containing the different subjects and the different activity types.

It next merges/binds these different tables together to create one singular table that contains all of the information for each individual record. Each record has a subject, activity, activity name, and all of the different measurements recorded.

In accordance with the desired output, all of the measurement columns not representing mean or standard deviation are removed. The data is then grouped by both activity and subject, and the mean of each measurment is calculated for each of the 180 groups. There are 180 groups because there are 30 subjects and 6 activities, which leads to 180 different combinations. 

## Source

The original data comes from the following source:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
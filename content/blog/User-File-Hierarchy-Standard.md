---
title: NotAwesome User File Hierarchy Standard
date: 2019-05-04
tags: [config]
---

## Introduction

NotAwesome User File Hierarchy Standard aims to help user better manage their resources and files in user space. The standard takes account of all storage at hand or online. It follows tree principles:

* Accessibility: Anytime you want to locate a resource, you know where it resides and can be accessed
* Convinience: Frequent used resource should be accessed fast
* Safe: data not lost

<!--more-->

## File Type

* Work
  * Homework
* Resource
  * Music
  * Book
  * Essay
  * Dataset
  * Video
  * Pictures
* Project
  * normal project
  * collective project
* Temporary File
  * test file
  * Downloads

## Attribute

When designing the file hierarchy, following attribute should be considered

* Time: it should a divide attribute at low level
* Topic
* Tools
* Frequency

## Availbale Device

We divide the devices into two kinds: in use and back up. File arrangement in two place should be different. Mobile end is not considered.

* in use
  * Macbook SSD (500GB)
* back up
  * HHD1 (2TB)
  * HHD2 (1TB)
  * HHD3 (500GB)
  * flash disk1
  * flash disk2
  * Baidu Netdisk (5TB)
  * Google Drive
  * icloud

## Arrangement on in-use device

User's top file directory, different from the system's, are capitalized.

| Name | Description |
| ---- | ----------- |
| ~/   | user config file |
| ~/Applications | ./ISO ./Packages, ./Library |
| ~/Datasets | |
| ~/Documents | ./CalibreLibrary ./Essays |
| ~/Learnings | ./Past ./Lecture |
| ~/Movies | ./Lectures, ./Films, ./Short |
| ~/Music | |
| ~/Pictures | |
| ~/Resources/ | ./Fonts ./Voices ./Pictures ./Movies |
| ~/Projects | Project |
| ~/Projects/Github | projects from github |
| ~/Projects/xxxProjcets | IDE projects (idea~, AndroidStudio~) |
| ~/Projects/xxxScripts | |
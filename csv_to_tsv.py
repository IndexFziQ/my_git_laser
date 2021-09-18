#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
@File   : json_to_tsv.py
@Author : Yuqiang Xie
@Date   : 2021/2/1
@E-Mail : indexfziq@gmail.com
"""

import csv

source_text_path = '/data/xieyuqiang/story_comprehension/data/roc/roc_test.csv'
# source_text_path = 'your_data_path'
with open (source_text_path, 'r', encoding='utf-8') as data_file,\
        open (source_text_path + "_generated.tsv", 'w', encoding='utf-8') as new_file:
    reader = csv.reader (data_file)
    next(reader)
    # new_file.write ('source\ttarget\n')
    for line in reader:
        # source = line['initial']
        # target = line['counterfactual']
        source = line[5]
        target = 'none'
        new_file.write (source + "\t" + target + "\n")

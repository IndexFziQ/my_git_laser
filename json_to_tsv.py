#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
@File   : json_to_tsv.py
@Author : Yuqiang Xie
@Date   : 2021/2/1
@E-Mail : indexfziq@gmail.com
"""

import jsonlines

# source_text_path = '/data/xieyuqiang/story_comprehension/data/counterfactual_unsupervised.json'
source_text_path = 'your_data_path'
with open (source_text_path, 'r', encoding='utf-8') as data_file,\
        open (source_text_path + "_generated.tsv", 'w', encoding='utf-8') as new_file:
    reader = jsonlines.Reader (data_file)
    # new_file.write ('source\ttarget\n')
    for line in reader:
        # source = line['initial']
        # target = line['counterfactual']
        source = line['key1']
        target = line['key2']
        new_file.write (source + "\t" + target + "\n")

#!/usr/bin/env python3
import pandas
import sys


excel_data_fragment = pandas.read_excel(sys.argv[1], sheet_name=sys.argv[2])

json_str = excel_data_fragment.to_json()

print(json_str)

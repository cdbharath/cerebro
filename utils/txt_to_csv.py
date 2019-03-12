import csv
import sys
import pandas as pd

txt_file = "/home/jeyamariajose/Projects/Cerebro/data/OpenBCI-RAW-blink_clench_1.txt"
csv_file = "/home/jeyamariajose/Projects/Cerebro/data/clench_1.csv"

data = pd.read_csv(txt_file, sep=" ", header=None)
#data.columns = ["ind", "a", "b", "w1","w2","w3","w4","w5","w6"]
print data
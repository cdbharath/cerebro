import pandas as pd 
import csv

data  = pd.read_csv('/home/jeyamariajose/Projects/Cerebro/data/RAW/clench_1.csv',names = ['ind','a','b'])


#print data
var = 0

temp = list()
temp2 = list()
with open('/home/jeyamariajose/Projects/Cerebro/data/RAW/clench_1.csv', 'r') as csvfile:
	csv_reader = csv.reader(csvfile, delimiter = ',')
	#print csv_reader
	for row in csv_reader:
		with open('/home/jeyamariajose/Projects/Cerebro/data/train/sample.csv', 'wb') as myfile:
			
			temp.append(row[0])
			temp.append(row[1])
			temp.append(row[2])

			print temp
			
			
			
			
			
			temp[:]=[]
			#print row[0] 
			if row[0] == '200':
				temp2.append(temp)
				print temp2
				wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
				wr.writerow(temp2)
				temp2[:]=[]



				


				
				

						

	
f =open('/home/jeyamariajose/Projects/Cerebro/data/RAW/scrunch.csv')

loc = '/home/jeyamariajose/Projects/Cerebro/data/train/data'

f1 = open(loc+'1.csv','w')
f2 = open(loc+'label3.csv','w')

file=575

lno=0
lno1=0
check=0
t=1
for line in f:
	if t == 1:
		if(lno==200):
			check+=1
			if(check==5):
				t = -1
				check=0

			lno = -1
			file+=1
			f1.close()
			f2.write("3\n")
			f1=open(loc+str(file)+".csv",'w')
		else:
			f1.write(line)


	elif t == -1:

		if(lno==200):
			check+=1
			if(check==5):
				t=1
				check=0
			lno = -1
			file+=1
			f1.close()
			f2.write("0\n")

			f1=open(loc+str(file)+".csv",'w')
		else:
			f1.write(line)

	
	lno+=1

f2.close()
f1.close()

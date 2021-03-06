#!/usr/bin/python2

import csv
import os
import sys

''' CONFIG '''

# PATHS
''' Path relative to this script for input data files '''
input_path = 'input'

''' Path relative to this script for output data files '''
output_path = 'output'


# OpenBCI SETTINGS

'''
OBCI data doesn't include a timestamp. We'll calculate the
timestamps based on the sample rate.
'''

input_sample_rate = 200

''' END CONFIG '''

# input_headers = ['id','chan1','chan2','chan3','chan4','chan5','chan6','chan7','chan8','accel1','accel2','accel3']
output_headers = ['Time','chan1','chan2','chan3','chan4','chan5','chan6','chan7','chan8','Sample_rate']
input_headers = ['id','chan1','chan2','chan3','chan4','accel1','accel2','accel3','ganglionTime','serialno']
# output_headers = ['Time','chan1','chan2','chan3','chan4','Sample_rate']

files = os.listdir(input_path)

csv_files = ['OpenBCI-RAW-test.csv']

if(len(csv_files) < 1):
  print "error"
  raw_input()
  
for input_fn in csv_files:

  print "Processing file: "+input_fn+" ... "

  output_data = []

  time_counter = 0
  time_increment = float(1)/float(input_sample_rate)

  print "Sample rate: "+str(input_sample_rate)+" ... "
  print "Time increment: "+str(time_increment)+" ... "


  with open(os.path.join(input_path,input_fn), 'rb') as csvfile:


     for i, line in enumerate(csvfile):
          if i == 2:
            sr_line = line
            break

    #  input_sample_rate = sr_line[15:21]
     input_sample_rate = '0.000'

     csv_input = csv.DictReader(csvfile, fieldnames=input_headers, dialect='excel')
     row_count = 0

     for row in csv_input:

          row_count = row_count + 1

          if(row_count > 3):

            output = {}

            time_counter = time_counter + time_increment
            # time_counter = '100.000'

            output['Time'] = time_counter

            for i in range(1,9):
              channel_key = 'chan'+str(i)
              output[channel_key] = '0.000'

            output['Sample_rate'] = input_sample_rate

            output_data.append(output)



  output_fn = "converted_"+input_fn

  print os.path.join(output_path,output_fn)

  output_csv_file = open(os.path.join(output_path,output_fn), 'wb+')

  csv_output = csv.DictWriter(output_csv_file, fieldnames=output_headers, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

  headers_text = {}

  for val in output_headers:
    headers_text[val] = val

  csv_output.writerow(headers_text)

  for row in output_data:
    csv_output.writerow(row)

  output_csv_file.close()

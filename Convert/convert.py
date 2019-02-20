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

input_headers = ['id','chan1','chan2','chan3','chan4','accel1','accel2','accel3','ganglionTime','serialno']

channel_keys = {'chan1':'FP1','chan2':'FP2','chan3':'O1','chan4':'O2'}

files = os.listdir(input_path)

csv_files = []
for filename in files:
  if '.csv' in filename:
    csv_files.append(filename)

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

     input_sample_rate = sr_line[15:21]
     output_headers = ['Time:%sHz'%input_sample_rate,'Epoch','FP1','FP2','O1','O2','Event Id','Event Date','Event Duration']

     csv_input = csv.DictReader(csvfile, fieldnames=input_headers, dialect='excel')
     row_count = 0
     epoch_count = 0

     for row in csv_input:

          row_count = row_count + 1

          if(row_count > 3):

            output = {}

            output['Time:%sHz'%input_sample_rate] = time_counter
            time_counter = time_counter + time_increment

            epoch_count = (row_count-4) / 4
            output['Epoch'] = epoch_count

            for i in range(1,5):
              channel_key = 'chan'+str(i)
              output[channel_keys[channel_key]] = row[channel_key]

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

/*
Class: pgm4.cpp
Author: Dylan Capece
Date: 4/19/2020
Description: using openacc to track elapsed and triple loop time on gpu k80, p100, cscomet and bridges. 
Parameters: main
*/
#include <cstdlib>
#include <stdio.h>
#include <time.h>
#include <math.h>
#include <openacc.h>

//initialize and zero pad data, filter and output array
float d[1024][16384+1024] = {{0}};
float out[1024][16384] = {{0}};
int main(int argc, char *argv[]) {
  //variables
  double startelap = Wtime();
  int size;
  struct timeval prog_start_time;
  struct timeval prog_end_time;
  struct timeval kern_start_time;
  struct timeval kern_end_time;
  //initialize filter file descriptor
  FILE * filter;
    //initialize data file descriptor
  FILE * data;

  //more variables
  double start,end;
  int filter_length = 1024;
  int trace_count = 1024;
  int trace_length = 16384;

  //initialize size
  size = filter_length;
   //create buffer array to read filter data into
  double buffer[size];

  //open filter file for reading only
  filter = fopen("/home/data/files/filt.bin", "rb");

  //open data file for reading only
  data = fopen("/home/data/files/data.bin", "rb");

  //read data into buffer array from filter file
  fread(buffer, sizeof(float), filter_length*sizeof(float), filter);

  //read into data array from data file
  fread(d, sizeof(float), trace_length*sizeof(float),data);

  //start time
  double start = Wtime();
  //data filtering operation
  #pragma acc kernels
  for( int j=0; j<trace_count; j++){
    for( int i = 0; i<trace_length; i++){
      for ( int k = 0; k<filter_length; k++){
        out[j][i] += buffer[k] * d[j][i+k-filter_length/2];
      }
    }
  }
  //end time
  double end = Wtime();
  double looptime = ((end-start)/4);
  fflush(stdout);

   //close data file
  fclose(data);
  //close filter file
  fclose(filter);
  double endelap = Wtime();
  double elapsedtime = ((endelap-startelap)/4);
  printf(" %f %f \n",(looptime, elapsedtime));
  return 0;
}

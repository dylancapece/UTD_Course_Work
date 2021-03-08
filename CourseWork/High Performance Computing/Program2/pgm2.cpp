/*
Class: pgm2.cpp 
Author: Dylan Capece
Date: 2/23/2020
Description: the mpi/c++ file for splitting the number of traces between the number of nodes. 
Parameters: main
*/
#include <stdlib.h>
#include <iostream>
#include <sys/time.h>
#include <time.h>
#include <mpi.h>
#include <stdio.h>
#define trace_length 16385
#define filter_length 1024
#define trace_count 1024
  //initialize and zero pad data, filter and output array
  float d[trace_count][trace_length+filter_length] = {{0}};
  float f[filter_length] = {0};
  float out[trace_count][trace_length] = {{0}};
int main(int argc, char* argv[]) {
  //initialize variables
  int rank;
  int size;

  double time;
  //starts up MPI
  MPI_Init (&argc, &argv);
  //gives process rank
  MPI_Comm_rank (MPI_COMM_WORLD,&rank);
  //gives number of processes
  MPI_Comm_size (MPI_COMM_WORLD, &size);
  //where each process starts indexing
  int low_bound = (rank*trace_count/size);
  //where each process stops
  int high_bound = ((rank+1)*trace_count/size);
  
  //initialize filter file descriptor
  FILE * filter_fd;
  //open filter file for reading only
  filter_fd = fopen("/home/data/files/filt.bin", "rb");
  //initialize data file descriptor
  FILE * data_fd;
  //open data file for reading only
  data_fd = fopen("/home/data/files/data.bin", "rb");
  //initialize size
  size = filter_length;
  //create buffer array to read filter data into
  float buffer[size];
  //read data into buffer array from filter file
  fread(buffer, sizeof(float), trace_length+sizeof(float), filter_fd);
  //close filter file
  //fclose(filter_fd);
  //read into data array from data file
   for(int k=511; k<trace_length+1024-512; k++)
  {
    fread(d, sizeof(float), trace_length+sizeof(float),data_fd);
  }
  //close data file
  //fclose(data_fd);
  //start time
  float start = MPI_Wtime();
  //data filtering operation
  for( int j=low_bound; j<high_bound; j++){
    for( int i = 0; i<trace_length; i++){
      for ( int k = 0; k<filter_length; k++){
        out[j][i] += buffer[k] * d[j][i+k-filter_length/2];
      }
    }
  }
  //end time
  float end = MPI_Wtime();
  printf("%f, %i, %i\n",end - start, low_bound, high_bound);
  fflush(stdout);

  MPI_Finalize();
   //close data file
  fclose(data_fd);
  //close filter file
  fclose(filter_fd);
  return 0;
}
/*
Class: pgm3.cpp
Author: Dylan Capece
Date: 3/08/2020
Description: the mpi/c++ file that exclusively lets each process read the filter file.
Using OpenMp along with MPI to calculate the time and speedup.
Parameters: main
*/
#include <cstdlib>
#include <omp.h>
#include <mpi.h>
#include <stdio.h>
#include <time.h> //program 6 addition
//initialize and zero pad data, filter and output array
float d[1024][16384+1024] = {{0}};
float out[1024][16384] = {{0}};

int main(int argc, char *argv[]) {

  //initialize variables
  int rank;
  int sizeofcomm;

  //starts up MPI
  MPI_Init (&argc, &argv);
  //gives process rank
  MPI_Comm_rank (MPI_COMM_WORLD,&rank);
  //gives number of processes
  MPI_Comm_size (MPI_COMM_WORLD, &sizeofcomm);
  //more variables
  int size;
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

  //where each process starts indexing
  int low_bound = ((rank*trace_count)/sizeofcomm);
  //where each process stops
  int high_bound = ((rank+1)*trace_count/sizeofcomm);

  //open filter file for reading only
  filter = fopen("/home/data/files/filt.bin", "rb");

  //open data file for reading only
  data = fopen("/home/data/files/data.bin", "rb");

  //read data into buffer array from filter file
  fread(buffer, sizeof(float), filter_length*sizeof(float), filter);

  //read into data array from data file
  fread(d, sizeof(float), trace_length*sizeof(float),data);

  
  // clock time before
  struct timespec before;
  clock_gettime(CLOCK_MONOTONIC, &before);
  
  //start time
  start = MPI_Wtime();
  //data filtering operation
  #pragma omp parallel for
  for( int j=low_bound; j<high_bound; j++){
    for( int i = 0; i<trace_length; i++){
      for ( int k = 0; k<filter_length; k++){
        out[j][i] += buffer[k] * d[j][i+k-filter_length/2];
      }
    }
  }
  //end time
  end = MPI_Wtime();
  
  //clock time after 
  struct timespec after;
  clock_gettime(CLOCK_MONOTONIC, &after);
  
  printf("Triple Loop time: %ld seconds. \n",(after.tv_sec - before.tv_sec));
  fflush(stdout);

  MPI_Finalize();

   //close data file
  fclose(data);
  //close filter file
  fclose(filter);
  return 0;
}

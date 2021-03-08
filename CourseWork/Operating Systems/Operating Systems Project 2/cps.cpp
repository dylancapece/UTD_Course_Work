//Dylan Capece

#include <iostream>
#include <fstream>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/ipc.h>
#include <cstdio>
#include <cstring>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <string>
#include <stdbool.h>
#include <cstdlib>
#include <tgmath.h>
#include <cmath>
#include <pthread.h>


using namespace std;


// define global variable for position in array and array for calculated numbers
static int *arr_counter;                                                                // this is a global counter in shared process for keeping track of location in initial array
static int *curr_location;                                                              // this is a global counter in shared process for keeping track of location in current step array
int *steponeArr;                                                                        // this is the step one array
int *steptwoArr;                                                                        // this is the step two array
int *outputArr;


// An array to store information about worker threads
std::thread workers[m];

// A reusable barrier for worker threads to synchronize
boost::barrier rendevousz(m);

// function to implement step one: Compute the sums of consecutive pairs of items in which the first item of the pair has an even index: z0 = x0 + x1, z1 = x2 + x3, etc.
void stepOnePrefix(int m,int n, int arr[]) {

    // for loop creating each child process
    for (int i = 0; i < m; ++i) {
        if (m == 0) {                                                                   // if child process
            // set the first number of the array equal to the input array
            if (*arr_counter == 0) {

                cout << "\nCurrent id of Thread : "<< pthread_self() << "";           // print thread ID
                outputArr[0] = arr[0];                                                   // set first number of array
                steponeArr[0] = arr[0] + arr[1];                                         // add first and second number of array
                *arr_counter = 2;                                                        // advance global array counter
                *curr_location = 1;                                                      // set current location pointer equal to 1
                exit(0);                                                                 // exit

            // if not the first number, calculate value of each even numbered value and its next value (by incrementing array by two instead of one)
            } else if (*arr_counter != 0) {
                cout << "\nCurrent id of Thread : "<< pthread_self() << "\n";         // print thread ID
                steponeArr[*curr_location] = arr[*arr_counter + 1] + arr[*arr_counter];  // prefix sum finder
                *arr_counter = *arr_counter + 2;                                         // advance global array counter by two
                *curr_location = *curr_location + 1;                                     // advance current array counter by two
                exit(0);                                                                 // exit
            }
        }
   	else {
                workers[i] = m;                                                 // add thread to array
   	}

}

}

// function to implement step two: Recursively compute the prefix sum w0, w1, w2, ... of the sequence z0, z1, z2, ...
void steptwoPrefix(int m) {

    // for loop creating each child process
    for (int i = 0; i < m; ++i) {

        if (m== 0) {                                                                    // if child thread
            // set the first number of the array equal to the input array
            if (*arr_counter == 0) {
                cout << "\nCurrent id of Thread : "<< pthread_self() << "";           // print thread ID
                steptwoArr[0] = steponeArr[0];                                           // set first number of array
                *arr_counter = *arr_counter + 1;                                         // advance global array counter
                exit(0);                                                                 // exit

            // if not the first number, calculate value
            } else {
                cout << "\nCurrent id of Thread : "<< pthread_self() << "";           // print thread ID
                steptwoArr[*arr_counter] = steptwoArr[*arr_counter-1] + steponeArr[*arr_counter]; // prefix sum finder
                *arr_counter = *arr_counter + 1;                                         // advance global array counter
                exit(0);                                                                 // exit
            }
        }
   	else {
                workers[i] = m;                                                 // add thread to array
   	}
}

}

// Function to implement step 3: Express each term of the final sequence y0, y1, y2, ... as the sum of up to two terms of these intermediate sequences: y0 = x0, y1 = z0, y2 = z0 + x2, y3 = w0, etc.
// After the first value, each successive number yi is either copied from a position half as far through the w sequence, or is the previous value added to one value in the x sequence.
void stepthreePrefix(int m, int arr[]) {

    // for loop creating each child process
    for (int i = 0; i < m; ++i) {

        if (m == 0) {                                                                               // if child thread

            // set the first number of the array equal to the input array
            if (*arr_counter == 0) {
                cout << "\nCurrent id of Thread : "<< pthread_self() << "";                      // print thread ID
                outputArr[1] = steponeArr[0];                                                       // set second number of array as first value of step one array
                outputArr[2] = steponeArr[0] + arr[2];                                              // set third number of array as first value of step one array and second value of input array
                *arr_counter = 3;                                                                   // advance global array counter
                exit(0);                                                                            // exit

            // if not the first number, calculate value
            }
             else {
                outputArr[*arr_counter] = steptwoArr[*arr_counter/2];                               // because the second step array only calculated every other array value, we need to divide the pointer to put each value in the appropriate location
                outputArr[*arr_counter + 1] = outputArr[*arr_counter] + arr[*arr_counter + 1 ];     // the odd numbered array values can be calculated by using the last value + the current value of the initial array
                cout << "\nCurrent id of Thread : "<< pthread_self() << "";                      // print thread ID
                *arr_counter = *arr_counter + 2;                                                    // increment counter by two to accommodate for calculating two values
                exit(0);                                                                            // exit
            }
        }
   	else {
                workers[i] = m;                                                 // add thread to array
   	}
}

}

// Main method that accepts all the arguments by using argv, reads and writes to the files using ifstream and ofstream and with loops to traverse the file and then final array
int main(int argc, char** argv)
{

	// values of input
	int m = atoi(argv[4]);                  // convert number of processes from prompt to int
        string outputfile(argv[3]);             // string for file output
	int n = atoi(argv[1]);                  // convert number of n from prompt to int
	int A[n]; 				// array for reading files
    	int x;					// temporary location to store each value
    	ifstream inFile; 			// stream to open and read file
        ofstream outFile;                       // stream to open and write to file
	// share value of array counter in memory
    	arr_counter = static_cast<int*>(mmap(NULL, sizeof *arr_counter, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0));
      steponeArr = static_cast<int*>(mmap(NULL, sizeof *A, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0));
      steptwoArr = static_cast<int*>(mmap(NULL, sizeof *A, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0));
  	  outputArr = static_cast<int*>(mmap(NULL, sizeof *A, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0));
      curr_location = static_cast<int*>(mmap(NULL, sizeof *curr_location, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0));
    	*arr_counter = 0;
    	*curr_location = 0;

        // Set input file name and open it
    	inFile.open(argv[2]);
        // Set output file name and open it
        outFile.open(argv[3]);


	// If file name not found display error
    	if (!inFile) {
        	cout << "Unable to open input file!";
        	exit(1); 			// terminate with error
    	}
        if (!outFile) {
        	cout << "Unable to open output file!";
        	exit(1); 			// terminate with error
    	}

	// Read and store file contents
	int i = 0; 				// initalize counter to 0;
    	while (inFile >> x) {			// loop through file contents
		A[i] = x;			// set value at location i to value from file
		i = i + 1;			// add one to counter
    	}

	int check = sizeof(A) / sizeof(A[0]);	// find input length

	// Checking that sizes of m and a are appropriate (array size is equal to n, m divides n evenly, m is not greater than n, and m and n are not negative)
	if (check != n) {			// check if input length same as n
		cout << "Error: input 'n' does not match file contents!";
        	exit(1); 			// terminate with error
	} else if (n % m != 0) {
		cout << "Error: input 'm' does not divide 'n' evenly!";
        	exit(1); 			// terminate with error
	} else if (m > n) {
		cout << "Error: input 'm' size not allowed!";
        	exit(1); 			// terminate with error
	} else if (m < 0 || n < 0) {
            	cout << "Error: input 'm' or 'n' size not allowed!";
        	exit(1); 			// terminate with error
        }
        int counter[m];
        // Initialize all counters
        for(int i = 0; i < m; ++i)
           counter[i] = 0;

        // Create worker threads
        // First parameter is the name of the function each thread has to execute
        // Next parameters are the parameters to the function
        for(int i = 0; i < counter/m; ++i)
           workers[i] = std::thread(stepOnePrefix, m, n, A);
           *arr_counter = 0;                               // reset counter
           *curr_location = 0;                             // reset counter
        for(int i = 0; i < n/2; ++i)
            workers[i] = std::thread(steptwoPrefix, m);
           *arr_counter = 0;                               // reset counter
        for(int i = 0; i < counter/m*2; ++i)
            workers[i] = std::thread(stepthreePrefix, m, A);

        // Wait for all worker threads to terminate
        // It is crucial to join to all the child threads in order to wait for them to complete
        // If the main thread terminates before the child threads, it will force terminate all the child threads
        for(int i = 0; i < m; ++i)
           workers[i].join( );


        // Print all the counter values
        for(int i = 0; i < m; ++i)
           std::cout << "count[" << i << "] = " << counter[i] << std::endl;

/*
        int counter = n/2;
        // while the array is not completely populated, create more children for step one
        for (int i = 0; i < (counter/m); i++) {
           stepOnePrefix(m,n,A);
        }

    	*arr_counter = 0;                               // reset counter
    	*curr_location = 0;                             // reset counter

        // while the array is not completely populated, create more children for step 2
        for (int i= 0; i < (n/2); i = i+m) {
       	steptwoPrefix(m);
        }

        *arr_counter = 0;                               // reset counter

        counter = n/3;
        // while the array is not completely populated, create more children for step 3
        for (int i = 0; i < (counter/m * 2); i++) {
           stepthreePrefix(m,A);
        }
*/

        // copy array to output-file
        for (int i= 0; i < n; i = ++i) {
            outFile << outputArr[i] << " ";             // write array integer with a space between
        }


        munmap(arr_counter, sizeof *arr_counter);	// unmap shared value from memory
        munmap(outputArr, sizeof *outputArr);           // unmap shared array from memory
        munmap(steponeArr, sizeof *steponeArr);         // unmap shared array from memory
        munmap(steptwoArr, sizeof *steptwoArr);         // unmap shared array from memory
        munmap(curr_location, sizeof *curr_location);	// unmap shared value from memory

    	inFile.close();                                 // close file

        return 0;                                       // end program

}

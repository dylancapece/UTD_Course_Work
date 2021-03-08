#include <iostream>
#include <thread>
#include <mutex>
using namespace std;
std::mutex mtx; //locks the bathroom

//Bathroom in use
void arriveAtTheBathroom(int gender)
{
  //locks the bathroom while being used
  mtx.lock();
  string Gender = (gender == 0?"Male":"Female");
  cout<<"Bathroom is occupied by "<<Gender<<endl;

}

//Leaves the Bathroom
void leaveTheBathroom(int gender)
{
  //unlocks bathroom
  mtx.unlock();
  string Gender = (gender == 0?"Male":"Female");
  cout<<"Bathroom is being left by "<<Gender<<endl;
}


void Male_Uses_Bathroom() {
  arriveAtTheBathroom(0);
  leaveTheBathroom(0);
}
void Female_Uses_Bathroom()
{
  arriveAtTheBathroom(1);
  leaveTheBathroom(1);
}

int main ()
{
  //Creating 4 instances to run
  thread runs[4];

  //test runs
  runs[0] = thread(Male_Uses_Bathroom);
  runs[1] = thread(Female_Uses_Bathroom);
  runs[3] = thread(Male_Uses_Bathroom);
  runs[2] = thread(Female_Uses_Bathroom);

  //executred program through all runs giving control back by join
  for (auto& th : runs) th.join();

  return 0;
}

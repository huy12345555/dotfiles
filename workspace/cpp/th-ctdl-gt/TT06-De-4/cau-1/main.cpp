#include <bits/stdc++.h>
using namespace std;

void readFile(int arr[][100], int &n, int &m)
{
  ifstream ifs("input.txt");
  ifs >> n >> m;
  for (int i = 0; i < n; i++)
  {
    
    for (int j = 0; j < m; j++)
    {
      ifs >> arr[i][j];
    }
  }
  ifs.close();
}

void sortA(int arr[][100], int n, int m)
{
  int temp[n * m];
  int k = 0;
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < m; j++)
    {
      temp[k++] = arr[i][j];
    }
  }

  sort(temp, temp + k);

  k = 0;
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      arr[i][j] = temp[k++];
    }
  }
}

void writeFile(int arr[][100], int n, int m)
{
  ofstream ofs("output.txt");
  ofs << n << " " << m << endl;
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < m; j++)
    {
      ofs << arr[i][j] << " ";
    }
    ofs << endl;
  }
  ofs.close();
}

int main()
{
  int arr[100][100], n, m;
  readFile(arr, n, m);
  sortA(arr, n, m);
  writeFile(arr, n, m);
  cout << "Da sap xep xong, vui long kiem tra file output.txt" << endl;
  return 0;
}

#include <iostream>
using namespace std;

void input(int a[], int &n, int &x)
{
  cout << "Nhap so phan tu cua mang: ";
  cin >> n;
  for (int i = 0; i < n; i++)
  {
    cout << "Nhap phan tu thu " << i + 1 << ": ";
    cin >> a[i];
  }
  cout << "Nhap so can chen: ";
  cin >> x;
}

int checkIfInArray(int a[], int n, int x)
{
  for (int i = 0; i < n; i++)
  {
    if (a[i] == x)
    {
      return 1;
    }
  }
  return 0;
}

void sortArray(int a[], int n)
{
  int i, key, j;
  for (i = 1; i < n; i++)
  {
    key = a[i];
    j = i - 1;
    while (j >= 0 && a[j] > key)
    {
      a[j + 1] = a[j];
      j = j - 1;
    }
    a[j + 1] = key;
  }
}

void insertToArray(int a[], int &n, int x)
{
  a[n] = x;
  n++;
  sortArray(a, n);
}

void output(int a[], int n)
{
  cout << "Mang sau khi chen: ";
  for (int i = 0; i < n; i++)
  {
    cout << a[i] << " ";
  }
}

int main()
{
  int a[100], n, x;
  input(a, n, x);
  if (checkIfInArray(a, n, x))
  {
    cout << "So can chen da co trong mang" << endl;
  }
  else
  {
    insertToArray(a, n, x);
    output(a, n);
  }
  return 0;
}
#include <bits/stdc++.h>
using namespace std;

bool arePermutation(string str1, string str2)
{
  int n1 = str1.length();
  int n2 = str2.length();
  if (n1 != n2)
  {
    return false;
  }
  sort(str1.begin(), str1.end());
  sort(str2.begin(), str2.end());
  for (int i = 0; i < n1; i++)
  {
    if (str1[i] != str2[i])
    {
      return false;
    }
  }

  return true;
}

int main()
{
  string str1, str2;
  cout << "Nhap chuoi A: ";
  getline(cin, str1);
  cout << "Nhap chuoi B: ";
  getline(cin, str2);
  if (arePermutation(str1, str2))
  {
    cout << "Chuoi A = \"" << str1 << "\" va chuoi B = \"" << str2 << "\" la 2 chuoi hoan vi cua nhau" << endl;
  }
  else
  {
    cout << "Chuoi A = \"" << str1 << "\" va chuoi B = \"" << str2 << "\" khong la hoan vi cua nhau" << endl;
  }
  return 0;
}

#include <iostream>
#include <fstream>
using namespace std;

void readFile(int a[], int &n)
{
    ifstream ifs("input.txt");

    ifs >> n;
    for (int i = 0; i < n; i++)
    {
        ifs >> a[i];
    }

    ifs.close();
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

int ktCapSoNhan(int a[], int n)
{
    int q = a[1] / a[0];
    for (int i = 1; i < n - 1; i++)
    {
        if (a[i] * q != a[i + 1])
        {
            return 0;
        }
    }
    return q;
}

void writeFile(int a[], int n)
{
    ofstream ofs("output.txt");

    ofs << ktCapSoNhan(a, n);

    ofs.close();
}

int main()
{
    int a[100], n;
    readFile(a, n);
    sortArray(a, n);
    ktCapSoNhan(a, n);
    writeFile(a, n);
    cout << "Da kiem tra xong, vui long kiem tra file output.txt" << endl;

    return 0;
}

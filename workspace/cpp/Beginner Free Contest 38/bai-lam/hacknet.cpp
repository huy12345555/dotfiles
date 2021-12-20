#include <iostream>
using namespace std;

void quichSort(int arr[], int n)
{
    if (n < 2)
        return;
    int mid = arr[n / 2];
    int i = 0, j = n - 1;
    while (i <= j)
    {
        while (arr[i] < mid)
            i++;
        while (arr[j] > mid)
            j--;
        if (i <= j)
        {
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            i++;
            j--;
        }
    }
    quichSort(arr, i);
    quichSort(arr + i, n - i);
}

int result(int arr[], int n)
{
    int max1 = arr[n - 1], max2;
    int min1 = arr[0], min2;
    do {
        max2 = arr[n - 2];
        min2 = arr[1];
    } while (max2 < max1 && min2 > min1);
    return (max1 - min2) * (max2 - min1);
}

int main() {
    int n;
    cin >> n;
    int arr[n];
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }
    quichSort(arr, n);
    cout << result(arr, n) << endl;
    return 0;
}

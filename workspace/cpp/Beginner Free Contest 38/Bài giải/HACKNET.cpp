#include <bits/stdc++.h>
#define FOR(i, a, b) for(int i=a, _n=b; i<=_n; ++i)

using namespace std;

const int N = 1e5+5;
int n, a[N];

int main()
{
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

    cin >> n;
    FOR(i, 1, n) cin >> a[i];
    sort(a+1, a+1+n);
    cout << max((a[n]-a[1])*(a[n-1]-a[2]), (a[n]-a[2])*(a[n-1]-a[1])) << '\n';
}

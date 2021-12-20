#include <bits/stdc++.h>
#define rep(i,a,b) for (int i=(a); i<(b); ++i)
#define double long double
using namespace std;
const int maxn = 10000;
const int maxm = 20000;

int n;
double p;
double dp[maxn][2];


inline double caldp(int x,int y) {
	y&=1;
	dp[x][y] = 0;
	if (x > 0) dp[x][y] += 0.5*dp[x-1][1-y];	
	dp[x][y] += 0.5*dp[x][1-y];
	return dp[x][y];
}

int main() {
	ios_base::sync_with_stdio(0);
	cin >> n >> p;
	p/=100;
	dp[0][0] = 1;

	for (int y=1; y<=maxm; ++y) {
		int cnt = 0;
		double current_p = 0;
		rep(x,0,n) {
			 current_p += caldp(x,y);
			 if (current_p > p) cnt++;
		}
		if (cnt>=n/2+(n%2)) continue;
		cout << y-1;
		break;
	}
	return 0;
}

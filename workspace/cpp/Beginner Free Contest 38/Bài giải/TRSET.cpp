#include <bits/stdc++.h>

using namespace std;

signed main(){
	
	ios_base::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

	int N, U, V;

	cin >> N >> U >> V;

	int L = U;
	int R = U;

	int p = U;
	while(p <= V){
		int temp = N / p;
		int d = min(N / temp, V);
		if(d - p + 1 > R - L + 1){
			L = p;
			R = d;
		}
		p = d + 1;
	}

	cout << L << " " << R << "\n";

	return 0;
}
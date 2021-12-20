#include <bits/stdc++.h>
using namespace std;

void solve() {
  int n;
  cin >> n;

  unordered_set<int> st;
  while (n != 1) {
    if (st.count(n)) {
      cout << "NO\n";
      return;
    }
    st.insert(n);

    int m = n, k = 0, d;
    while (m > 0) {
      d = m % 10;
      k += d * d;
      m /= 10;
    }
    n = k;
  }
  cout << "YES\n";
}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(0);
  int T;
  cin >> T;
  while (T--) {
    solve();
  }
  return 0;
}

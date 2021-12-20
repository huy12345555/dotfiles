#include <bits/stdc++.h>
#define ll int
#define cll const ll
#define lp(a, b, c) for(ll a = b; a <= c; ++a)
#define lpd(a, b, c) for(ll a = b; a >= c; --a)
#define vec(a) vector<a>
#define pp(a, b) pair<a, b>
#define EACHCASE lpd(cs, read(), 1)
#define Fname "MEAL"
using namespace std;

ll read(){
    ll tmp;
    scanf("%d", &tmp);
    return tmp;
}

struct segment{
private:
    vec(ll) st;
    ll n;
    void update(ll id, ll l, ll r, ll u, int d){
        if(u < l || u > r) return;
        if(l == r){
            st[id] += d;
            return;
        }
        ll mid = (l + r) >> 1;
        update(id << 1, l, mid, u, d);
        update(id << 1 | 1, mid + 1, r, u, d);
        st[id] = max(st[id << 1], st[id << 1 | 1]);
    }
    ll get(ll id){
        return st[id];
    }
public:
    segment(ll _n) : n(_n), st(4 * _n + 3){}
    void update(ll u, int d){update(1, 1, n, u, d);}
    ll get(){return get(1);}
};

cll mxn = 1e5 + 7;
ll n, k, a[mxn];
segment tree(1e5);

int main(){
#ifdef giuncute
    ios_base::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
#endif
    EACHCASE{
        scanf("%d %d", &n, &k);
        lp(i, 1, n) scanf("%d", a + i);
        ll j = 1, ans = 0;
        lp(i, 1, n){
            tree.update(a[i], 1);
            while(i - j + 1 - tree.get() > k) tree.update(a[j++], -1);
            ans = max(ans, i - j + 1);
        }
        lp(i, j, n) tree.update(a[i], -1);
        printf("%d\n", ans);
    }
}
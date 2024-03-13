/*
 * CF: saifshahriar3301
 */

#ifdef ONPC
    #define _GLIBCXX_DEBUG
#endif
#include <bits/stdc++.h>
#define sz(a) ((int)((a).size()))
#define char unsigned char

using namespace std;
mt19937 rnd(chrono::steady_clock::now().time_since_epoch().count());

int sol() {
	
	return 0;
}

int32_t main() {
	ios::sync_with_stdio(0);
	cin.tie(0);
	int testCases = 1e9;
	cin >> testCases;
	for (int i = 1; i <= testCases; i++) {
	    #ifdef ONPC
			cout << "L" << i << ": ";
	    #endif
	    if (sol()) break;
	    #ifdef ONPC
			cout << "__________________________" << endl;
	    #endif
	}
	#ifdef ONPC
		cerr << endl << "finished in " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl;
	#endif
}

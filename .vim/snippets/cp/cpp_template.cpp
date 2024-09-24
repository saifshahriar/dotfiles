/*
 * Author: Saif Shahriar
 */

#define InTheNameofAllah ios::sync_with_stdio(0); cin.tie(0);
#ifdef ONPC
	#define _GLIBCXX_DEBUG
#endif
#include <bits/stdc++.h>
#define sz(a) ((int)((a).size()))
#define char unsigned char
using namespace std;
#define endl "\n"
mt19937 rnd(chrono::steady_clock::now().time_since_epoch().count());

// TODO: Replace `const` with `#define`.
const bool HAS_TESTCASES = true;

int sol() {
	return 0;
}

int32_t main() {
	InTheNameofAllah
	/* int testcases = 1e9; */
	int testcases = 1;
	if (HAS_TESTCASES)
		cin >> testcases;
	for (int i = 1; i <= testcases; ++i) {
		#ifdef ONPC
			cout << i << ": ";
		#endif
		if (sol())
			break;
		#ifdef ONPC
			cout << "__________________________" << endl;
		#endif
	}
		#ifdef ONPC
			cerr << endl
				 << "took " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl;
		#endif
}

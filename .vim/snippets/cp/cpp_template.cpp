/*
 * Author: Saif Shahriar
 */

#define InTheNameofAllah ios::sync_with_stdio(0), cin.tie(0);
/// {{{ Helper
// clang-format off
#ifdef ONPC
#include <bits/_ojdebug.h>
#define _GLIBCXX_DEBUG
#define debug(x) cerr << #x <<" "; _print(x); cerr << endl;
#else
#include <bits/stdc++.h>
#define debug(x)
using namespace std;
#endif

/* macros */
#define ALL(v) (v).begin(), (v).end()
#define MOD    1e9+7
#define SUM(v) accumulate((v).begin(), (v).end(), 0)
#define el     '\n'
#define sz(a)  ((int)((a).size()))

/* typedefs */
#define ll     long long
#define ull    unsigned long long
#define ld     long double

/* helper functions */
mt19937 rnd(chrono::steady_clock::now().time_since_epoch().count());
// clang-format on
/// }}}

#define HAS_TESTCASES

void sol() {
}

/// {{{ Main
// clang-format off
int32_t main() {
	InTheNameofAllah
	/* int testcases = 1e9; */
	int testcases = 1;
	#ifdef HAS_TESTCASES
	cin >> testcases;
	#endif
	for (int i = 1; i <= testcases; ++i) {
		#ifdef ONPC
		#ifndef CIDE
		cout << i << ": ";
		#endif
		#endif
		sol();
		#ifdef ONPC
		#ifndef CIDE
		cout << "__________________________" << el;
		#endif
		#endif
	}
	#ifdef ONPC
	#ifndef CIDE
	cout << el;
	#endif
	cerr << "took " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << el;
	#endif
}
// vim: foldmethod=marker
/// }}}

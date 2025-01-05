/*
 * Author: Saif Shahriar
 */

#define InTheNameofAllah ios::sync_with_stdio(0), cin.tie(0);
/// {{{ Helper
// clang-format off
#ifdef ONPC
#define _GLIBCXX_DEBUG
#define debug(x) cerr << #x <<" "; _print(x); cerr << endl;
#else
#define debug(x)
#endif
#include <bits/stdc++.h>
using namespace std;

/* macros */
#define ALL(v) (v).begin(), (v).end()
#define INF    INT_MAX
#define MOD    1e9+7
#define SUM(v) (accumulate((v).begin(), (v).end(), 0))
#define el     "\n"
#define sz(a)  ((int)((a).size()))

/* typedefs */
#define char   unsigned char
#define const  constexpr
#define ll     long long
#define ull    unsigned long long
#define ld     long double

/* helper functions */
mt19937 rnd(chrono::steady_clock::now().time_since_epoch().count());
#ifdef ONPC
void _print(long long t)          { cerr << t; }
void _print(int t)                { cerr << t; }
void _print(string t)             { cerr << t; }
void _print(char t)               { cerr << t; }
void _print(long double t)        { cerr << t; }
void _print(double t)             { cerr << t; }
void _print(unsigned long long t) { cerr << t; }

/* templates */
template <class T, class V> void _print(pair<T, V> p);
template <class T> void          _print(vector<T> v);
template <class T> void          _print(set<T> v);
template <class T, class V> void _print(map<T, V> v);
template <class T> void          _print(multiset<T> v);

template <class T, class V> void _print(pair<T, V> p) {
	cerr << "{";
	_print(p.first);
	cerr << ",";
	_print(p.second);
	cerr << "}";
}

template <class T> void _print(vector<T> v) {
	cerr << "[ ";
	for (T i : v) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}

template <class T> void _print(set<T> v) {
	cerr << "[ ";
	for (T i : v) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}

template <class T> void _print(multiset<T> v) {
	cerr << "[ ";
	for (T i : v) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}

template <class T, class V> void _print(map<T, V> v) {
	cerr << "[ ";
	for (auto i : v) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}
#endif
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

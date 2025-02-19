/* Put this header file in your compiler library path.
 * Make it precompiled .ghc before using for faster execution:
 *     doas g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -O2 -DONPC -DCIDE -H -x c++-header ./stdc++./_ojdebug.h
 */

#include <bits/stdc++.h>
using namespace std;

/* helper functions */
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

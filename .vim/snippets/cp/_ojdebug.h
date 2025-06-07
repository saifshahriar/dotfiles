/* 
 * Author: Saif Shahriar
 *
 * Put this header file in your compiler library path.
 * Make it precompiled .ghc before using for faster execution:
 *     doas g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -O2 -DONPC -DCIDE -H -x c++-header ./stdc++.h
 *     doas g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -O2 -DONPC -DCIDE -H -x c++-header ./_ojdebug.h
 */

/* #include <bits/stdc++.h> */
#include <algorithm>
#include <bitset>
#include <cctype>
#include <chrono>
#include <climits>
#include <cmath>
#include <complex>
#include <cstring>
#include <functional>
#include <iomanip>
#include <iostream>
#include <iterator>
#include <map>
#include <numeric>
#include <queue>
#include <random>
#include <set>
#include <stack>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <vector>
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
template <class T> void          _print(multiset<T> v);
template <class T, class V> void _print(map<T, V> v);
template <class T> void          _print(stack<T> st);
template <class T> void          _print(queue<T> q);
template <class T> void          _print(deque<T> dq);
template <class T> void          _print(priority_queue<T> pq);
template <class T> void          _print(priority_queue<T, vector<T>, greater<T> > pq);
template <class T> void          _print(unordered_set<T> us);
template <class T, class V> void _print(unordered_map<T, V> um);

/* definitions */
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

template <class T> void _print(stack<T> st) {
	vector<T> temp;
	while (!st.empty()) {
		temp.push_back(st.top());
		st.pop();
	}
	reverse(temp.begin(), temp.end());   // to print in original order
	_print(temp);
}

template <class T> void _print(queue<T> q) {
	vector<T> temp;
	while (!q.empty()) {
		temp.push_back(q.front());
		q.pop();
	}
	_print(temp);
}

template <class T> void _print(deque<T> dq) {
	cerr << "[ ";
	for (T i : dq) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}

template <class T> void _print(priority_queue<T> pq) {
	vector<T> temp;
	while (!pq.empty()) {
		temp.push_back(pq.top());
		pq.pop();
	}
	_print(temp);
}

template <class T> void _print(priority_queue<T, vector<T>, greater<T> > pq) {
	vector<T> temp;
	while (!pq.empty()) {
		temp.push_back(pq.top());
		pq.pop();
	}
	_print(temp);
}

template <class T> void _print(unordered_set<T> us) {
	cerr << "[ ";
	for (T i : us) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}

template <class T, class V> void _print(unordered_map<T, V> um) {
	cerr << "[ ";
	for (auto i : um) {
		_print(i);
		cerr << " ";
	}
	cerr << "]";
}

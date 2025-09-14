/*
 * Author: Saif Shahriar
 */

#define InTheNameofAllah ios::sync_with_stdio(0), cin.tie(0);
/// {{{ Helper
// clang-format off
#ifdef ONPC
// #define _GLIBCXX_DEBUG
#include <bits/_ojdebug.h>
#define debug(x) cerr << #x <<" "; _print(x); cerr << endl;
#else
#include <bits/stdc++.h>
#define debug(x)
using namespace std;
#endif

/* macros */
#define el              '\n'
#define len(x)          ((int)((x).size()))
#define all(x)          (x).begin(), (x).end()
#define rall(x)         (x).rbegin(), (x).rend()
#define getbit(n, i)    (((n) & (1LL << (i))) != 0)
#define setbit0(n, i)   ((n) & (~(1LL << (i))))
#define setbit1(n, i)   ((n) | (1LL << (i)))
#define togglebit(n, i) ((n) ^ (1LL << (i)))
#define lsb(n)          ((n) & (-(n)))
#define msb_pos(n)      ((x) == 0 ? -1 : 31 - __builtin_clzll(x))
#define yes             puts("yes")
#define Yes             puts("Yes")
#define YES             puts("YES")
#define no              puts("no")
#define No              puts("No")
#define NO              puts("NO")

/* typedefs */
#define ll  long long
#define ull unsigned long long
#define ld  long double

/* constants */
constexpr int       MOD   = 1e9 + 7;
constexpr int       MX    = 2e5 + 5;
constexpr long long INF   = 1e18;
constexpr int       N     = 2e5 + 5;
constexpr double    EPS   = 1e-9;
constexpr int       dx[4] = { 1, 0, -1, 0 };
constexpr int       dy[4] = { 0, 1, 0, -1 };

/* templates */
template <typename Container> auto sum(const Container& c) {
	using T = typename decay<decltype(*c.begin())>::type;
	return accumulate(c.begin(), c.end(), T { 0 });
}

template <typename Container> auto prod(const Container& c) {
	using T = typename decay<decltype(*c.begin())>::type;
	return accumulate(c.begin(), c.end(), T { 0 }, multiplies<>());
}

template <typename T> vector<vector<T> > gps(const vector<T>& v) {
	return accumulate(v.begin(), v.end(), vector<vector<T> > { {} },
	                  [](vector<vector<T> > acc, const T& x) {
		                  vector<vector<T> > sets = acc;
		                  for (auto& e : acc) {
			                  auto ns = e;
			                  ns.push_back(x);
			                  sets.push_back(ns);
		                  }
		                  return sets;
	                  });
}

struct uniq_t {
    template<class T> friend T operator|(T v, const uniq_t&) {
        sort(v.begin(), v.end());
        v.erase(unique(v.begin(), v.end()), v.end());
        return v;
    }
} uniq;

/* helper functions */
mt19937 rnd(chrono::steady_clock::now().time_since_epoch().count());

// mod
long long mod_add(long long a, long long b, long long m = MOD) { return (a + b) % m; }
long long mod_sub(long long a, long long b, long long m = MOD) { return (a - b + m) % m; }
long long mod_mul(long long a, long long b, long long m = MOD) { return (a * b) % m; }
long long mod_pow(long long a, long long b, long long m = MOD) {
	long long res  = 1;
	a             %= m;
	while (b) {
		if (b & 1)
			res = mod_mul(res, a, m);
		a   = mod_mul(a, a, m);
		b >>= 1;
	}
	return res;
}
long long mod_inv(long long a, long long m = MOD) { return mod_pow(a, m - 2, m); }

/* algorithms */
// Sieve
vector<int> spf;

void sieve(int n) {
	spf.assign(n + 1, 1);
	spf[0] = spf[1] = 0;
	for (int i = 2; i * i <= n; ++i)
		if (spf[i])
			for (int j = i * i; j <= n; j += i)
				spf[j] = 0;
}

// DSU
struct DSU {
		vector<int> parent, size;

		DSU(int n) : parent(n), size(n, 1) {
			iota(parent.begin(), parent.end(), 0);
		}

		int find(int x) {
			return (parent[x] == x) ? x : parent[x] = find(parent[x]);
		}

		bool unite(int a, int b) {
			a = find(a);
			b = find(b);
			if (a == b)
				return false;
			if (size[a] < size[b])
				swap(a, b);
			parent[b]  = a;
			size[a]   += size[b];
			return true;
		}
};

// BIT (Fenwick)
struct BIT {
		int         n;
		vector<int> tree;

		BIT(int size) : n(size), tree(size + 1) {
		}

		void update(int index, int value) {
			for (++index; index <= n; index += index & -index)
				tree[index] += value;
		}

		int query(int index) {
			int result = 0;
			for (++index; index > 0; index -= index & -index)
				result += tree[index];
			return result;
		}

		int query(int left, int right) {
			return query(right) - query(left - 1);
		}
};

// SegTree (RSQ)
struct SegTree {
		int               n;
		vector<long long> tree;

		SegTree(int size) : n(size), tree(4 * n) {
		}

		void update(int index, long long value, int node = 1, int left = 0,
		            int right = -1) {
			if (right == -1)
				right = n - 1;
			if (left == right) {
				tree[node] = value;
				return;
			}
			int mid = (left + right) / 2;
			if (index <= mid)
				update(index, value, 2 * node, left, mid);
			else
				update(index, value, 2 * node + 1, mid + 1, right);

			tree[node] = tree[2 * node] + tree[2 * node + 1];
		}

		long long query(int ql, int qr, int node = 1, int left = 0,
		                int right = -1) {
			if (right == -1)
				right = n - 1;
			if (qr < left || ql > right)
				return 0;
			if (ql <= left && right <= qr)
				return tree[node];

			int mid = (left + right) / 2;
			return query(ql, qr, 2 * node, left, mid)
			     + query(ql, qr, 2 * node + 1, mid + 1, right);
		}
};

// SparseTable (RMQ)
struct SparseTable {
		vector<vector<int> > table;
		vector<int>          log;

		SparseTable(const vector<int>& values) {
			int n = values.size();
			log.assign(n + 1, 0);
			for (int i = 2; i <= n; ++i)
				log[i] = log[i / 2] + 1;

			table.assign(log[n] + 1, vector<int>(n));
			table[0] = values;

			for (int j = 1; j <= log[n]; ++j)
				for (int i = 0; i + (1 << j) <= n; ++i)
					table[j][i] =
					    min(table[j - 1][i], table[j - 1][i + (1 << (j - 1))]);
		}

		int query(int left, int right) {
			int j = log[right - left + 1];
			return min(table[j][left], table[j][right - (1 << j) + 1]);
		}
};

// Matrix
using Matrix = vector<vector<long long> >;

Matrix matrix_multiply(const Matrix& a, const Matrix& b, long long mod = MOD) {
	int    rows = a.size(), cols = b[0].size(), inner = b.size();
	Matrix result(rows, vector<long long>(cols, 0));

	for (int i = 0; i < rows; ++i)
		for (int k = 0; k < inner; ++k)
			for (int j = 0; j < cols; ++j)
				result[i][j] = (result[i][j] + a[i][k] * b[k][j] % mod) % mod;

	return result;
}

Matrix matrix_power(Matrix base, long long exponent, long long mod = MOD) {
	int    n = base.size();
	Matrix result(n, vector<long long>(n, 0));
	for (int i = 0; i < n; ++i)
		result[i][i] = 1;

	while (exponent > 0) {
		if (exponent % 2 == 1)
			result = matrix_multiply(result, base, mod);
		base      = matrix_multiply(base, base, mod);
		exponent /= 2;
	}

	return result;
}

// Z-Function (Z-Algorithm)
vector<int> z_function(const string& s) {
	int         n = s.length();
	vector<int> z(n);
	int         left = 0, right = 0;

	for (int i = 1; i < n; ++i) {
		if (i <= right)
			z[i] = min(right - i + 1, z[i - left]);
		while (i + z[i] < n && s[z[i]] == s[i + z[i]])
			++z[i];
		if (i + z[i] - 1 > right)
			left = i, right = i + z[i] - 1;
	}
	return z;
}

// KMP
vector<int> prefix_function(const string& s) {
	int         n = s.length();
	vector<int> pi(n);
	for (int i = 1; i < n; ++i) {
		int j = pi[i - 1];
		while (j > 0 && s[i] != s[j])
			j = pi[j - 1];
		if (s[i] == s[j])
			++j;
		pi[i] = j;
	}
	return pi;
}

// Binary Search
int binary_search_index(const vector<int>& arr, int target) {
    int left = 0, right = arr.size() - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target)
            return mid;
        (arr[mid] < target) ? (left = mid + 1) : (right = mid - 1);
    }
    return -1;
}
// clang-format on
/// }}}

#define HAS_TESTCASES
/* #define PRINTCASES */

void sol() {
}

/// {{{ Main
// clang-format off
int32_t main() {
	InTheNameofAllah
	int testcases = 1;
	#ifdef HAS_TESTCASES
	cin >> testcases;
	#endif
	for (int i = 1; i <= testcases; ++i) {
		#ifdef PRINTCASES
		cout << "Case " << i << ": ";
		#endif
		sol();
	}
}
// vim: foldmethod=marker
/// }}}

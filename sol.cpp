#include <iostream>
#include <cstring>
using namespace std;

int t, n, m, cs, ans, c;
char s[2005][2005];
bool f[2005][2005];


void dfs(int x, int y) {
    if (x < 0 || y < 0 || x >= m || y >= n || s[x][y] == '1' || f[x][y]) return;
    f[x][y] = 1;
    c++;
    dfs(x + 1, y);
    dfs(x - 1, y);
    dfs(x, y + 1);
    dfs(x, y - 1);
}

int main() {

    cin >> t;

    for (cs = 1; cs <= t; cs++) {
    
        cin >> m >> n;


        for (int i = 0; i < m; i++) {
            cin >> s[i];
        }

        memset(f, 0, sizeof f);

        ans = 0;        

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (s[i][j] == '0' && f[i][j] == 0) {
                    c = 0;
                    dfs(i, j);
                    ans = max(ans, c);
                }
            } 
        }

        cout << "Floor #" << cs << ": " << ans << "\n";

    }
    return 0;
}

### NHL Clustering

Small test to see how PCA and K-means clustering would do caterogizing NHL teams making (or not making) the Stanley Cup Playoffs. First I reduced the data to just the key features (using PCA) and then tried clustering from that. And it worked (results below)! It only messed up on Boston and Detroit but they were in a tight race to make the playoffs, so that makese sense. Math continues to prevail!

| Team | Made Playoffs | K-means Cluster |
|------|---------------|-----------------|
| ANA  | YES           | 1               |
| ARI  | NO            | 2               |
| BOS  | NO            | 1               |
| BUF  | NO            | 2               |
| CAR  | NO            | 2               |
| CBJ  | NO            | 2               |
| CGY  | NO            | 2               |
| CHI  | YES           | 1               |
| COL  | NO            | 2               |
| DAL  | YES           | 1               |
| DET  | YES           | 2               |
| EDM  | NO            | 2               |
| FLA  | YES           | 1               |
| LAK  | YES           | 1               |
| MIN  | YES           | 1               |
| MTL  | NO            | 2               |
| NJD  | NO            | 2               |
| NSH  | YES           | 1               |
| NYI  | YES           | 1               |
| NYR  | YES           | 1               |
| OTT  | NO            | 2               |
| PHI  | YES           | 1               |
| PIT  | YES           | 1               |
| SJS  | YES           | 1               |
| STL  | YES           | 1               |
| TBL  | YES           | 1               |
| TOR  | NO            | 2               |
| VAN  | NO            | 2               |
| WSH  | YES           | 1               |
| WPG  | NO            | 2               |
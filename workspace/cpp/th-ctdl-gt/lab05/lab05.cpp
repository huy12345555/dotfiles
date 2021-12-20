#include <iostream>
using namespace std;

typedef int Data;

struct BSTNode
{
  Data info;
  BSTNode *left;
  BSTNode *right;
};

typedef BSTNode *Tree;
Tree T, T1;
int found = 0;

void initTree(Tree &T)
{
  T = NULL;
}

int empty(Tree T)
{
  return (T == NULL ? 1 : 0);
}

void insertNode(Data x, Tree &T)
{
  if (empty(T))
  {
    Tree p = new BSTNode;
    p->info = x;
    p->left = p->right = NULL;
    T = p;
  }
  else if (x < T->info)
  {
    insertNode(x, T->left);
  }
  else
  {
    insertNode(x, T->right);
  }
}

void createTree(Tree &T)
{
  Data x;
  initTree(T);
  do
  {
    cout << "Nhap 1 gia tri, nhap 0 de dung: ";
    cin >> x;
    if (x != 0)
    {
      insertNode(x, T);
    }
  } while (x != 0);
}

void NLR(Tree T)
{
  if (!empty(T))
  {
    cout << T->info << " ";
    NLR(T->left);
    NLR(T->right);
  }
}

void LRN(Tree T)
{
  if (!empty(T))
  {
    LRN(T->left);
    LRN(T->right);
    cout << T->info << " ";
  }
}

void LNR(Tree T)
{
  if (!empty(T))
  {
    LNR(T->left);
    cout << T->info << " ";
    LNR(T->right);
  }
}

Tree search(Data x, Tree T)
{
  if (empty(T))
    return NULL;
  if (x == T->info)
    return T;
  if (x < T->info)
  {
    return search(x, T->left);
  }
  else
  {
    return search(x, T->right);
  }
}

void search2Num(int M, Tree T)
{
  if (T != NULL)
  {
    int L = T->info;
    if (L < M)
    {
      int K = M - L;
      Tree p = search(K, T1);
      if (p != NULL && L > K)
      {
        cout << L << "+" << K << "=" << M << endl;
        found = 1;
      }
    }
    search2Num(M, T->left);
    search2Num(M, T->right);
  }
}

int countNode(Tree T)
{
  if (empty(T))
    return 0;
  else
    return 1 + countNode(T->left) + countNode(T->right);
}

int countNodeHave1Ele(Tree T)
{
  if (!empty(T))
  {
    int a = countNodeHave1Ele(T->left);
    int b = countNodeHave1Ele(T->right);
    if ((T->left != NULL && T->right == NULL) || (T->left == NULL && T->right != NULL))
    {
      return 1 + a + b;
    }
    return a + b;
  }
  return 0;
}

int countNodeHave2Ele(Tree T)
{
	if (!empty(T))
	{
		int a = countNodeHave1Ele(T->left);
		int b = countNodeHave1Ele(T->right);
		if (T->left != NULL && T->right != NULL)
			return 1 + a + b;
		return a + b;
	}
	return 0;
}

int height(Tree T)
{
  if (!T)
    return 0;
  int l = height(T->left);
  int r = height(T->right);
  if (l > r)
    return l + 1;
  else
    return r + 1;
}

int main()
{
  int a[9] = {8, 3, 10, 1, 6, 14, 4, 7, 13};
  initTree(T);
  for (int i = 0; i < 9; i++)
  {
    insertNode(a[i], T);
  }
  // T1 = T;
  // createTree(T);
  cout << "Duyet thu tu truoc: ";
  NLR(T);
  cout << endl;
  cout << "Duyet thu tu giua: ";
  LNR(T);
  cout << endl;
  cout << "Duyet thu tu sau: ";
  LRN(T);

  // Tim kiem
  Data x;
  cout << endl << "Nhap gia tri can tim: ";
  cin >> x;
  cout << endl;
  Tree p = search(x, T);
  if (p != NULL)
  {
    cout << "Co " << x << " tren cay" << endl;
  }
  else
  {
    cout << "Khong co " << x << " tren cay" << endl;
  }
  search2Num(25, T);
  if (!found)
  {
    cout << "Khong co cap nao co tong = so cho truoc!" << endl;
  }
  cout << "So nut tren cay la: " << countNode(T) << endl;
  cout << "So luong nut co dung 1 con: " << countNodeHave1Ele(T) << endl;
  cout << "So luong nut co du 2 con: " << countNodeHave2Ele(T) << endl;
  cout << "Chieu cao cay la: " << height(T) << endl;

  return 0;
}

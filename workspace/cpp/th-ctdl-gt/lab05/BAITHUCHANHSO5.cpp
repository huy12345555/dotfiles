#include <iostream>
using namespace std;
typedef int Data;
struct BSTNode
{
	Data Info;
	BSTNode *Left;
	BSTNode *Right;
};
typedef BSTNode *Tree;
Tree T, T1;
int Found = 0;
void InitTree(Tree &T)
{
	T = NULL;
}

void Init(Tree &T)
{
	T = NULL;
}
int Empty(Tree T)
{
	return (T == NULL ? 1 : 0);
}
void InsertNode(Data x, Tree &T)
{
	if (Empty(T))
	{
		Tree p = new BSTNode; // BSTNode* p=new BSTNode;
		p->Info = x;
		p->Left = p->Right = NULL;
		T = p;
	}
	else if (T->Info > x)
		InsertNode(x, T->Left);
	else
		InsertNode(x, T->Right);
}
void CreateTree(Tree &T)
{
	Data x;
	InitTree(T);
	do
	{
		cout << "Nhap 1 gia tri, nhap 0 de dung: ";
		cin >> x;
		if (x != 0) // x>0
			InsertNode(x, T);
	} while (x != 0);
}
void NLR(Tree T)
{
	if (!Empty(T))
	{
		cout << T->Info << " ";
		NLR(T->Left);
		NLR(T->Right);
	}
}
void LRN(Tree T)
{
	if (!Empty(T))
	{
		LRN(T->Left);
		LRN(T->Right);
		cout << T->Info << " ";
	}
}
void LNR(Tree T)
{
	if (!Empty(T))
	{
		LNR(T->Left);
		cout << T->Info << " ";
		LNR(T->Right);
	}
}
Tree Search(Data x, Tree T)
{
	if (Empty(T))
		return NULL;
	if (x == T->Info)
		return T;
	if (x < T->Info)
		return Search(x, T->Left);
	else
		return Search(x, T->Right);
}
void Tim2so(int M, Tree T)
{
	if (T != NULL)
	{
		int L = T->Info;
		if (L < M)
		{
			int K = M - L;
			Tree p = Search(K, T1);
			if (p != NULL && L > K)
			{
				cout << L"+" << K << "=" << M << endl;
				Found = 1;
			}
		}
		Tim2so(M, T->Left);
		Tim2so(M, T->Right);
	}
}
int CountNode(Tree T)
{
	if (T == NULL)
		return 0;
	else
		return 1 + CountNode(T->Left) + CountNode(T->Right);
}
int Dem(Tree T)
{
	if (T != NULL)
	{
		int a = Dem(T->Left);
		int b = Dem(T->Right);
		if ((T->Left != NULL && T->Right == NULL) || (T->Left == NULL && T->Right != NULL))
			return 1 + a + b;
		return a + b;
	}
	return 0;
}
int Demm(Tree T)
{
	if (T != NULL)
	{
		int a = Dem(T->Left);
		int b = Dem(T->Right);
		if (T->Left != NULL && T->Right != NULL)
			return 1 + a + b;
		return a + b;
	}
	return 0;
}
int ChieuCao(Tree T)

{

	if (!T)

		return 0;

	int a = ChieuCao(T->Left);

	int b = ChieuCao(T->Right);

	if (a > b)

		return (a + 1);

	return (b + 1);
}
int main()
{
	int A[9] = {8, 3, 10, 1, 6, 14, 4, 7, 13};
	InitTree(T);
	for (int i = 0; i < 9; i++)
		InsertNode(A[i], T);
	cout << " duyet thu tu truoc:";
	NLR(T);
	cout << "\n";
	cout << " duyet thu tu giua: ";
	LNR(T);
	cout << "\n";
	cout << " duyet thu tu sau: ";
	LRN(T);
	// tim kiem
	Data x;
	cout << "\n nhap gia tri can tim:";
	cin >> x;
	Tree p = Search(x, T);
	if (p != NULL)
		cout << "co " << x << " tren cay ";
	else
		cout << " ko co " << x << " tren cay ";

	Tim2so(25, T);
	if (!Found)
		cout << " \n ko co cap nao co tong = so cho truoc!";
	cout << "\n so nut la: " << CountNode(T) << endl;
	cout << "\n so luong nut dung 1 con: " << Dem(T) << endl;
	cout << "\n so luong nut dung 2 con: " << Demm(T) << endl;
	cout << "\n chieu cao cay la: " << ChieuCao(T) << endl;
	return 0;
}

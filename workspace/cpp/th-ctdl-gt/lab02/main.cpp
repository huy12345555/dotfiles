// #include <bits/stdc++.h>
// using namespace std;
// struct Student
// {
// 	int id;
// 	char Name[30];
// 	float GPA;
// 	char Grade[15];
// };

// struct StudentNode
// {
// 	Student info;
// 	StudentNode *Next;
// };

// typedef StudentNode NODE;
// struct LIST
// {
// 	NODE *Head;
// 	NODE *Tail;
// };
// LIST L;

// NODE *CreateNode(Student x)
// {
// 	NODE *p;
// 	p = new NODE;
// 	p->info = x;
// 	p->Next = NULL;
// 	return p;
// }

void InitList(LIST &L)
{
	L.Head = L.Tail = NULL;
}

int IsEmpty(LIST L)
{
	return (L.Head == NULL) ? 1 : 0;
}

NODE *search(int x, LIST L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return NULL;
	}
	NODE *p;
	p = L.Head;
	while (p != NULL && p->info.id != x)
		p = p->Next;
	return p;
}
NODE *search1(int x, LIST L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return NULL;
	}
	NODE *q;
	NODE *p;
	p = L.Head;
	while (p != NULL && p->info.id != x)
	{
		q = p;
		p = p->Next;
	}
	return q;
}
void Addlast(NODE *p, LIST &L)
{
	if (IsEmpty(L))
		L.Head = L.Tail = p;
	else
	{
		L.Tail->Next = p;
		L.Tail = p;
	}
}

void CreateList(LIST &L)
{
	Student x;
	NODE *new_ele;
	do
	{
		cout << "Nhan ma SV, nhap 0 de ket thuc:";
		cin >> x.id;
		if (x.id != 0)
		{
			cout << "Nhap ho ten SV:";
			cin >> x.Name;
			cout << "Nhap DTB:";
			cin >> x.GPA;
			x.Grade[0] = '\0';
			new_ele = CreateNode(x);
			Addlast(new_ele, L);
		}
	} while (x.id != 0);
}
int menu()
{
	cout << "=================MENU================\n";
	cout << "Hay chon cac phuong an sau\n";
	cout << "Nhap 1: Tao danh sach sinh vien\n";
	cout << "Nhap 2: In danh sach sinh vien \n";
	cout << "Nhap 3: Tim kiem sinh vien qua masv \n";
	cout << "Nhap 4: Bo sung sinh vien\n";
	cout << "Nhap 5: Chen sinh vien len dau danh sach\n";
	cout << "Nhap 6: Chen sinh vien sau mot sinh vien khac\n";
	cout << "Nhap 7: Xep loai hoc sinh " << endl;
	cout << "Nhap 8: Xoa sinh vien dau tien" << endl;
	cout << "Nhap 9: Xoa sinh vien theo ma so" << endl;
	cout << "Nhap 10: Xoa sinh vien lien sau sinh vien co ma so" << endl;
	cout << "Nhap 11: Sap xep danh sach theo diem sinh vien" << endl;
	cout << "Nhap 0: De thoat!" << endl;
	int choice;
	cout << "Lua chon cua ban la: ";
	cin >> choice;
	return choice;
}
void PrintList(LIST L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return;
	}
	NODE *p;
	p = L.Head;
	while (p != NULL)
	{
		cout << p->info.id << "|" << p->info.Name << "|" << p->info.GPA << "|";
		cout << p->info.Grade << "\n";
		p = p->Next;
	}
}
void AddFirst(NODE *p, LIST &L)
{
	if (IsEmpty(L))
		L.Head = L.Tail = p;
	else
	{
		p->Next = L.Head;
		L.Head = p;
	}
}
void AddAfter(int x, LIST &L)
{
	NODE *q;
	NODE *p;
	Student y;
	q = search(x, L);
	if (q != NULL)
	{
		cout << "Nhap ma SV moi:";
		cin >> y.id;
		cout << "Nhap ho ten SV:";
		cin >> y.Name;
		cout << "Nhap DTB:";
		cin >> y.GPA;
		y.Grade[0] = '\0';
		p = CreateNode(y);
		p->Next = q->Next;
		q->Next = p;
		if (q == L.Tail)
			L.Tail = p;
	}
	else
		cout << "Khong tim thay sinh vien bi chen!\n";
}
void processList(LIST L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return;
	}
	NODE *p;
	p = L.Head;
	while (p != NULL)
	{
		if (p->info.GPA >= 8)
			strcpy(p->info.Grade, "Gioi");
		else if (p->info.GPA >= 6.5)
			strcpy(p->info.Grade, "Kha");
		else if (p->info.GPA >= 5)
			strcpy(p->info.Grade, "TB");
		else if (p->info.GPA < 5)
			strcpy(p->info.Grade, "yeu");
		p = p->Next;
	}
}
void deleteFirst(LIST &L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return;
	}
	NODE *p;
	p = L.Head;
	L.Head = L.Head->Next;
	delete (p);
}
void deleteX(int x, LIST &L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return;
	}
	NODE *p;
	NODE *q;
	p = search(x, L);
	q = search1(x, L);
	if (p != NULL)
	{
		q->Next = p->Next;
		free(p);
	}
	else
		cout << "Khong co sinh vien co ma do\n";
}
void deleteAfterX(int x, LIST &L)
{
	if (IsEmpty(L))
	{
		cout << "List is Empty!";
		return;
	}
	NODE *p;
	p = search(x, L);
	NODE *q;
	q = p->Next;
	if (p != NULL)
	{
		p->Next = q->Next;
		free(q);
	}
	else
		cout << "Khong co sinh vien co ma do\n";
}
void SortByMark(LIST &L)
{
	NODE *p;
	NODE *q;
	p = L.Head;
	q = L.Head;
	Student a;
	while (p != NULL)
	{
		q = search(p->info.id, L);
		while (q != NULL)
		{
			if (q->info.GPA > p->info.GPA)
			{
				a = p->info;
				p->info = q->info;
				q->info = a;
			}
			q = q->Next;
		}
		p = p->Next;
	}
}
int main()
{
	int choice;
	Student x;
	int Stid;
	NODE *p;
	do
	{
		choice = menu();
		switch (choice)
		{
		case 1:
		{
			CreateList(L);
			system("pause");
			system("cls");
			break;
		}
		case 2:
			PrintList(L);
			system("pause");
			system("cls");
			break;
		case 3:
			cout << "Nhap ma sinh vien can tim:";
			cin >> Stid;
			p = search(Stid, L);
			if (p != NULL)
			{
				cout << "Thong tin sinh vien tim duoc:\n";
				cout << p->info.id << "\n";
				cout << p->info.Name << "\n";
				cout << p->info.GPA << "\n";
				cout << p->info.Grade << "\n";
			}
			else
				cout << "Khong tim thay sinh vien nao";
			system("pause");
			system("cls");
			break;

		case 4:
			cout << "Nhap ma SV moi:";
			cin >> x.id;
			cout << "Nhap ho ten SV:";
			cin >> x.Name;
			cout << "Nhap DTB:";
			cin >> x.GPA;
			x.Grade[0] = '\0';
			p = CreateNode(x);
			Addlast(p, L);
			system("pause");
			system("cls");
			break;
		case 5:
			cout << "Nhap ma SV moi:";
			cin >> x.id;
			cout << "Nhap ho ten SV:";
			cin >> x.Name;
			cout << "Nhap DTB:";
			cin >> x.GPA;
			x.Grade[0] = '\0';
			p = CreateNode(x);
			AddFirst(p, L);
			system("pause");
			system("cls");
			break;
		case 6:
			cout << "Nhap ma SV bi chen:";
			cin >> Stid;
			AddAfter(Stid, L);
			system("pause");
			system("cls");
			break;
		case 7:
			processList(L);
			system("pause");
			system("cls");
			break;
		case 8:
			deleteFirst(L);
			system("pause");
			system("cls");
			break;
		case 9:
			cout << "Nhap ma sv muon xoa:";
			cin >> Stid;
			deleteX(Stid, L);
			system("pause");
			system("cls");
			break;
		case 10:
			cout << "Nhap ma sv muon xoa:";
			cin >> Stid;
			deleteAfterX(Stid, L);
			system("pause");
			system("cls");
			break;
		case 11:
			SortByMark(L);
			system("pause");
			system("cls");
			break;
		case 0:
		{
			cout << "Cam on ban da dung thu ung dung cua toi\n";
			system("pause");
			break;
		}
		}
	} while (choice != 0);
}

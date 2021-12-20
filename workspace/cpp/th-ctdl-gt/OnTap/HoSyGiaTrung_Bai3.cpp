#include <iostream>
#include <cmath>
using namespace std;

struct Node
{
  int data;
  Node *next;
};

void insertNode(Node *&head)
{
  int n;
  cout << "Nhap kich thuoc DS: ";
  cin >> n;
  cout << "Nhap cac phan tu trong DS: " << endl;
  for (int i = 0; i < n; i++)
  {
    Node *p = new Node;
    cin >> p->data;
    p->next = head;
    head = p;
  }
}

int isPrime(int n) {
  if (n == 1)
    return 0;
  for (int i = 2; i <= sqrt(n); i++)
  {
    if (n % i == 0)
      return 0;
  }
  return 1;
}

void split(Node *&head, Node *&head1, Node *&head2)
{
  Node *p = head;
  while (p != NULL)
  {
    if (isPrime(p->data))
    {
      Node *q = p;
      p = p->next;
      q->next = head1;
      head1 = q;
    }
    else
    {
      Node *q = p;
      p = p->next;
      q->next = head2;
      head2 = q;
    }
  }
}

void printList(Node *head)
{
  Node *p = head;
  while (p != NULL)
  {
    cout << p->data << " ";
    p = p->next;
  }
}

int main() {
  Node *head = NULL;
  Node *head1 = NULL;
  Node *head2 = NULL;
  insertNode(head);
  split(head, head1, head2);
  cout << "Day chua so nguyen so: ";
  printList(head1);
  cout << endl;
  cout << "Day khong chua so nguyen so: ";
  printList(head2);
  cout << endl;

  return 0;
}
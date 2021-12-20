#include <iostream>
using namespace std;

// create linked list
struct Node {
  int data;
  Node* next;
};

// insert node at the end of the list
void insert(Node*& head, int data) {
  Node* newNode = new Node;
  newNode->data = data;
  newNode->next = NULL;

  if (head == NULL) {
    head = newNode;
  } else {
    Node* temp = head;
    while (temp->next != NULL) {
      temp = temp->next;
    }
    temp->next = newNode;
  }
}



int main() {


  return 0;
}

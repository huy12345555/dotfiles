#include <iostream>
#include <vector>
using namespace std;

int main() {
    //create vector to store number
    vector<int> v;
    int x;
    cout << "Nhap 1 day so tu nhien, nhap -1 de dung: " << endl;
    while(cin >> x) {
        if (x == -1) break;
        v.push_back(x);
    }
    //create vector to store binary string
    vector<string> v1;
    //convert number to binary string
    for (int i = 0; i < v.size(); i++) {
        string s = "";
        while (v[i] > 0) {
            s = (v[i] % 2 == 0 ? "0" : "1") + s;
            v[i] /= 2;
        }
        v1.push_back(s);
    }
    //change vector store binary string to linked list
    struct Node {
        string data;
        Node *next;
    };
    Node *head = NULL;
    for (int i = 0; i < v1.size(); i++) {
        Node *p = new Node;
        p->data = v1[i];
        p->next = head;
        head = p;
    }
    //output with " -> " and not have " -> " at the end
    Node *p = head;
    while (p != NULL) {
        cout << p->data;
        if (p->next != NULL) cout << " -> ";
        p = p->next;
    }
    cout << endl;

    return 0;
}



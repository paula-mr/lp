class Node:
    def __init__(self):
        self.n = 0
        self.e = ''


class Stack:
    def __init__(self):
        self.head = 0
    
    def add(self, name):
        new_node = Node()
        new_node.e = name

        if self.head:
            new_node.n = self.head
        self.head = new_node
    
    def remove(self):
        removed_node = self.head
        self.head = removed_node.n
        return removed_node.e

    def isNotEmpty(self):
        return self.head != 0

s = Stack()
s.add("Baltimore")
s.add("Lord")
s.add("Sir")
print(s.isNotEmpty())

while s.isNotEmpty():
    print(s.remove())

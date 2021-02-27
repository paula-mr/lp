class Node:
    def __init__(self):
        self.n = 0
        self.e = ''


class Queue:
    def __init__(self):
        self.first = 0
        self.last = 0
    
    def add(self, name):
        new_node = Node()
        new_node.e = name

        if not self.first:
            self.first = new_node
        else:
            self.last.n = new_node
        self.last = new_node

    def remove(self):
        removed_node = self.first
        if self.first == self.last:
            self.last = 0
        self.first = removed_node.n
        return removed_node.e

    def isNotEmpty(self):
        return self.first != 0

    def getSmaller(self):
        smaller = self.first.e if self.first else ''
        next_node = self.first.n if self.first else 0

        while next_node != 0:
            if next_node.e < smaller:
                smaller = next_node.e
            next_node = next_node.n

        return smaller


s = Queue()
s.add("C")
s.add("A")
s.add("B")
print(s.isNotEmpty())
print(s.getSmaller())
print('*' * 10)


while s.isNotEmpty():
    print('Smaller', s.getSmaller())
    print('Removed', s.remove())


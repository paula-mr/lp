NULL = -1  # The null link


class HeapManager:
    """ Implements a very simple heap manager."""

    def __init__(self, initialMemory):
        """Constructor. Parameter initialMemory is the array of data that we will
        use to represent the memory."""
        self.memory = initialMemory
        self.memory[0] = self.memory.__len__()
        self.memory[1] = NULL

    def __get_best_fit(self, requestSize):
        p = 0
        size, index = self.memory[0], 0
        while p < len(self.memory) and self.memory[p] != requestSize:
            if self.memory[p] == requestSize and self.memory[p+1] == -1:
                return p
            if size >= self.memory[p] and requestSize <= self.memory[p] and self.memory[p+1] == -1:
                size = self.memory[p]
                index = p
            p += self.memory[p]
        return index if requestSize <= self.memory[index] and self.memory[index+1] == -1 else NULL

    def allocate(self, requestSize):
        """Allocates a block of data, and return its address. The parameter
        requestSize is the amount of space that must be allocated."""
        size = requestSize + 1
        # Do best -fit search
        p = self.__get_best_fit(requestSize)
        if p == NULL:
            raise MemoryError()
        # set space as occupied
        self.memory[p + 1] = 1

        # Now p is the index of a block of sufficient size,
        # lag is the index of p's predecessor in the
        # free list, or NULL, and nextFree is the index of
        # p's successor in the free list, or NULL.
        # If the block has more space than we need, carve
        # out what we need from the front and return the
        # unused end part to the free list.
        unused = self.memory[p] - size

        if unused > 1:
            nextFree = p + size
            self.memory[nextFree] = unused
            # Set memory block as unused
            self.memory[nextFree + 1] = -1
            self.memory[p] = size
            
        return p + 1

    def deallocate(self, address):
        self.memory[address] = -1


def test():
    h = HeapManager([0 for x in range(0, 10)])
    print(h.memory)
    a = h.allocate(4)
    print("a = ", a, ", Memory = ", h.memory)
    b = h.allocate(2)
    print("b = ", b, ", Memory = ", h.memory)
    c = h.allocate(1)
    print("c = ", c, ", Memory = ", h.memory)
    h.deallocate(a)
    print("Deallocated a Memory = ", h.memory)
    h.deallocate(b)
    print("Deallocated b Memory = ", h.memory)


test()
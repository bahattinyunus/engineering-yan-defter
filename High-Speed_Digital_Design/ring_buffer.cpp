#include <atomic>
#include <vector>
#include <iostream>

template <typename T>
class RingBuffer {
private:
    std::vector<T> buffer;
    std::atomic<size_t> head;
    std::atomic<size_t> tail;
    size_t max_size;

public:
    RingBuffer(size_t size) : buffer(size), max_size(size), head(0), tail(0) {}

    bool push(const T& item) {
        size_t current_head = head.load(std::memory_order_relaxed);
        size_t next_head = (current_head + 1) % max_size;

        if (next_head == tail.load(std::memory_order_acquire)) {
            return false; // Buffer full
        }

        buffer[current_head] = item;
        head.store(next_head, std::memory_order_release);
        return true;
    }

    bool pop(T& item) {
        size_t current_tail = tail.load(std::memory_order_relaxed);

        if (current_tail == head.load(std::memory_order_acquire)) {
            return false; // Buffer empty
        }

        item = buffer[current_tail];
        tail.store((current_tail + 1) % max_size, std::memory_order_release);
        return true;
    }
};

int main() {
    RingBuffer<int> rb(1024);
    
    // Simulate high-speed data producer
    for(int i = 0; i < 100; ++i) {
        rb.push(i);
    }
    
    // Simulate consumer
    int val;
    while(rb.pop(val)) {
        std::cout << "Processed: " << val << std::endl;
    }
    
    return 0;
}

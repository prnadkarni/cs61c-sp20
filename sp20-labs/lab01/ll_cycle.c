#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    node *fast = head;
    node *slow = head;
    while (fast && fast->next) {
        fast = fast->next->next;
        slow = slow->next;
        if (fast == slow) {
            return 1;
        }
    }
    return 0;
}

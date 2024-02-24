from __future__ import annotations
from dataclasses import dataclass
from tp4.llist import LinkedList, \
    ll_new, ll_len

#Exercice 6
@dataclass
class Deque:
    l : LinkedList

def d_new()-> Deque:
    l = ll_new()
    return Deque(l)

def d_is_empty(d: Deque) -> bool:
    return ll_is_empty(d.l)

def d_len(d: Deque) -> int:
    return ll_len(d.l)

def d_str(d: Deque) -> str:
    return ll_str(d.l)

def d_front(d: Deque) -> int:
    return d.l.head.value

def d_rear(d: Deque) -> int:
    return ll_tail(d.l).value

def d_push_front(d: Deque, item: int) -> Deque:
    ll_insert(d.l,item,l.head,False)
    return d

def d_push_rear(d: Deque, item: int) -> Deque:
    ll_insert(d.l,item,ll_tail(d.l),True)
    return d

def d_pop_front(d: Deque) -> Deque:
    ll_remove(d.l,l.head)
    return d

def d_pop_rear(d: Deque) -> Deque:
    ll_remove(d.l,ll_tail(d.l))
    return d
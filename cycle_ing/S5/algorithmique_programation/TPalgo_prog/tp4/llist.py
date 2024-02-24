from __future__ import annotations
from dataclasses import dataclass
from typing import Iterator


@dataclass
class LinkedList:
    length: int = 0
    head: Cell = None
    tail: Cell = None


@dataclass
class Cell:
    value : int = None
    next : Cell = None
    before : Cell = None

#Exercice1


def ll_new(initial_l: list[int] | None = None) -> LinkedList:
    if initial_l is not None:
        current_cell = Cell(initial_l[0])
        current = current_cell
        for value in initial_l[1:]:
            new_cell = Cell(value, before=current)
            current.next = new_cell
            current = new_cell
        return LinkedList(len(initial_l), current_cell, current)
    else:
        return LinkedList()


def ll_str(l: LinkedList) -> str:
    current_cell = l.head
    values = ''
    for i in range(l.length):
        if current_cell is not None:
            values += str(current_cell.value) +', '
            current_cell = current_cell.next
    return values

# Jeu de données
data = [1, 2, 3, 4, 5]

# Création de la LinkedList
linked_list = ll_new(data)
#print(linked_list)
#print(ll_str(linked_list))


def ll_is_empty(l: LinkedList) -> bool:
    return l.length == 0

def ll_len(l: LinkedList) -> int:
    return l.length

def ll_head(l: LinkedList) -> Cell:
    if ll_is_empty(l):
        raise IndexError
    else:
        return l.head


def ll_tail(l: LinkedList) -> Cell:
    if ll_is_empty(l):
        raise IndexError
    else:
        return l.tail
#print(ll_head(linked_list).value)
#print(ll_tail(linked_list).value)


#Exercice 2

def ll_get(l: LinkedList, idx: int) -> int:
    if idx < 0 or idx >= ll_len(l):
        raise IndexError("Index out of range")

    current_cell = ll_head(l)
    i = 0
    while i < idx:
        current_cell = current_cell.next
        i += 1

    return current_cell.value

#print(ll_get(linked_list,4))


def ll_set(l: LinkedList, idx: int, item: int) -> LinkedList:
    if idx < 0 or idx >= l.length:
        raise IndexError("Index out of range")

    current_cell = l.head
    i = 0
    while i < idx:
        current_cell = current_cell.next
        i += 1
    current_cell.value = item
    return l
#print(ll_str(ll_set(linked_list,4,15)))



def ll_insert(l: LinkedList, item: int, neighbor: Cell | None = None, after: bool = True) -> LinkedList:

    new_cell = Cell(item, None, None)

    if neighbor != None:
        if after:
            new_cell.before = neighbor
            new_cell.next = neighbor.next
            neighbor.next = new_cell
            new_cell.next.before = new_cell
        else:
            new_cell.before = neighbor.before
            new_cell.next = neighbor
            neighbor.before = new_cell
            neighbor.before.next = new_cell

    else:
        if after:
            new_cell.before = l.head
            new_cell.next = l.head.next
            l.head.next = new_cell
            l.head.next.before = new_cell
        else:
            new_cell.before = l.head.before
            new_cell.next = l.head
            l.head.before = new_cell
            l.head.before.next = new_cell

        if after:
            l.head = new_cell

    l.length += 1

    return l


def gen(n: int) -> Iterator[int]:
    yield 0
    for i in range(n):
        yield (i + 1) ** 2


#for carre in gen(5):   # suspend l'éxecution à chaque yield et retourne la valeur
 #   print(carre)       # reprend l'execution quand le générateur est rappelé


def ll_iter_cells(l: LinkedList) -> Iterator[Cell]:
    yield l.head  # jsp si je dois renvoyer aussi la sentinelle
    current_cell = l.head
    for i in range(ll_len(l)):
        yield current_cell.next


def ll_reversed_iter_cells(l: LinkedList) -> Iterator[Cell]:
    yield l.head
    current_cell = l.head
    for i in range(ll_len(l)):
        yield current_cell.before


#Exercice 3


def ll_lookup(l: LinkedList, item: int) -> Cell | None:
    current_cell = l.head
    for i in range(l.lenght):
        if current_cell.value == item:
            return current_cell
    return None



def ll_cell_at(l: LinkedList, i: int)-> Cell:
    current_cell = l.head
    for j in range(i):
        current_cell = current_cell.next

    if current_cell != l.head:
        return current_cell
    else:
        raise IndexError("Error")


def ll_remove(l: LinkedList, c: Cell) -> LinkedList:
    if ll_is_empty(l) is False:
        c.before.next = c.next
        c.next.before = c.before
        l.length -= 1

    return l


def ll_extend(l1: LinkedList, l2: LinkedList) -> LinkedList:
    if l1.length == 0:
        return l2

    current_cell = l1.head
    while current_cell.next is not None:
        current_cell = current_cell.next

    current_cell.next = l2.head.next
    l2.head.next.before = current_cell
    l1.length += l2.length

    return l1

#Exercice 6
@dataclass
class Deque:
    l : LinkedList


def d_new(initial_l: list[int] | None = None)-> Deque:
    l = ll_new(initial_l)
    return Deque(l)


deque = d_new([1,2,3,4,5])
print(deque)


def d_is_empty(d: Deque) -> bool:
    return d.l.length == 0


print(d_is_empty(deque))

def d_len(d: Deque) -> int:
    return d.l.length


def ll_str(l: LinkedList) -> str:
    result = []
    current = l.head
    while current:
        result.append(str(current.value))
        current = current.next
    return " <-> ".join(result)

def d_str(d: Deque) -> str:
    return ll_str(d.l)


def d_front(d: Deque) -> int:
    return d.l.head.value

print(d_front(deque))


def d_rear(d: Deque) -> int:
    return ll_tail(d.l).value

print(d_rear(deque))

def d_push_front(d: Deque, item: int) -> Deque:
    ll_insert(d.l,item,d.l.head,False)
    return d
d_push_front(deque,0)
print(d_str(deque))


def d_push_rear(d: Deque, item: int) -> Deque:
    ll_insert(d.l,item,ll_tail(d.l),True)
    return d

def d_pop_front(d: Deque) -> Deque:
    ll_remove(d.l,l.head)
    return d

def d_pop_rear(d: Deque) -> Deque:
    ll_remove(d.l,ll_tail(d.l))
    return d

#Exercice 8

@dataclass
class Stack:
    d : Deque

def s_new()-> Stack:
    d =_new()
    return Stack(d)

def s_is_empty(s: Stack) -> bool:
    return s.d.l.length == 0

def s_len(s: Stack) -> int:
    return s.d.l.length

def s_str(s: Stack) -> str:
    return ll_str(s.d.l)

def s_front(s: Stack) -> int:
    return s.d.l.head.value

def s_rear(s: Stack) -> int:
    return ll_tail(s.d.l).value

def s_push(s: Stack, item: int) -> Stack:
    ll_insert(s.d.l,item,l.head,False)
    return s

def s_pop(s: Stack) -> Deque:
    ll_remove(s.d.l,l.head)
    return s


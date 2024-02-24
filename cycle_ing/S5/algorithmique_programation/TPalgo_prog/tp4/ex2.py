from __future__ import annotations
from dataclasses import dataclass

@dataclass
class LinkedList:
    length : int
    head : Cell


@dataclass
class Cell:
    value : int
    next : Cell
    before : Cell

#Exercice 2

def ll_get(l: LinkedList, idx: Cell) -> int:
    if idx < 0 or idx >= l.length:
        raise IndexError("Index out of range")

    current_cell = LinkedList.head
    for i in range(l.length):
        current_cell = current_cell.next

    return current_cell.value

def ll_set(l: LinkedList, idx: Cell, item: int) -> LinkedList:
    if idx < 0 or idx >= l.length:
        raise IndexError("Index out of range")

    current_cell = LinkedList.head
    for i in range(l.length):
        current_cell = current_cell.next
    current_cell.value = item

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
            new_cell.before = l
            l.head = new_cell
        else:
            new_cell.next = l
            l.head = new_cell
    return l

def ll_new(initial_l: list[int] | None = None) -> LinkedList:
    sentinel = Cell(None, None, None)
    sentinel.next = sentinel
    sentinel.before = sentinel
    l = LinkedList(0,sentinel)

    for i in range(len(initial_l)):
        ll_insert(l,initial_l[i], sentinel, True)

    return l

def ll_iter_cells(l: LinkedList) -> Iterator[Cell]:
    yield l.head #jsp si je dois renvoyer aussi la sentinelle
    current_cell = l.head
    for i in range(ll_len(l)):
        yield current_cell.next

def ll_reversed_iter_cells(l: LinkedList) -> Iterator[Cell]:
    yield l.head
    current_cell = l.head
    for i in range(ll_len(l)):
        yield current_cell.before



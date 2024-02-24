from __future__ import annotations
from dataclasses import dataclass


# Exercice 1
@dataclass
class BinaryTree:
    root: Node = None


@dataclass
class Node:
    val: int = None
    left: Node = None
    right: Node = None


def bt_new() -> BinaryTree:
    return BinaryTree(None, None, None)


def bt_is_empty(bt: BinaryTree) -> bool:
    if bt.root is None:
        return True
    return False


def bt_root(bt: BinaryTree) -> Node:
    return bt.root


def n_new(k: int, left: Node | None = None, right: Node | None = None) -> Node:
    return Node(k, left, right)


def n_get(n: Node) -> int:  # -> clé (valeur entière) du noeud
    if n is not None:
        return n.val
    else:
        return None


def n_set(n: Node, k: int) -> None:  # affecte la clé k au noeud
    n.val = k


def n_left(n: Node) -> Node | None:  # -> noeud gauche
    return n.left


def n_right(n: Node) -> Node | None:  # -> noeud droit
    return n.right


def n_is_leaf(n: Node) -> bool:
    if n.left is None and n.right is None:
        return True
    return False


def n_const(i: int, nodes: list[int | None]) -> Node | None:
    if i >= len(nodes) or nodes[i] is None:
        return None

    else:
        node = n_new(nodes[i], None, None)

        node_left = n_const(2 * i + 1, nodes)
        node_right = n_const(2 * i + 2, nodes)

        node.left = node_left
        node.right = node_right

    return node


def bt_new(nodes: list[int | None] | None = None) -> BinaryTree:
    n = n_const(0, nodes)
    binarytree = BinaryTree(n)
    return binarytree


# nodes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# bt = bt_new(nodes)


# Exercice 2

def bt_height(bt: BinaryTree) -> int:  # hauteur de l'arbre (profondeur à partir de root)
    return n_depth(bt_root(bt))


def n_depth(n: Node) -> int:  # profondeur du noeud n
    if n_left(n) is not None and n_right(n) is not None:
        nb_node_left = n_depth(n_left(n))
        nb_node_right = n_depth(n_right(n))
        return max(nb_node_left, nb_node_right) + 1

    elif n_left(n) is not None:
        return n_depth(n_left(n)) + 1

    elif n_right(n) is not None:
        return n_depth(n_right(n)) + 1

    else:
        return 1


def n_number(n: Node) -> int:  # nb de noeuds à partir du noeud actuel
    if n is not None:

        if n_left(n) is not None and n_right(n) is not None:
            nb_node_left = n_number(n_left(n))
            nb_node_right = n_number(n_right(n))
            return nb_node_left + nb_node_right + 1

        elif n_left(n) is not None:
            return n_number(n_left(n)) + 1

        elif n_right(n) is not None:
            return n_number(n_right(n)) + 1

        else:
            return 1

    else:
        return 0


def bt_size(bt: BinaryTree) -> int:  # nb de noeuds dans l'arbre
    return n_number(bt_root(bt))


bt = BinaryTree(Node('A', Node('B', Node('D'), Node('E')), Node('C', Node('F'), Node('G', Node('I')))))

# print("height = ",bt_height(bt))
# print("size  = ",bt_size(bt))


from collections import deque


def bt_str(bt: BinaryTree) -> str:  # voir slide 148 ( parcours en largeur)
    result = []
    current_level = deque([bt_root(bt)])  # initialiser la file à la racine

    while current_level:  # tant que la file n'est pas vide
        level_str = ""
        next_level = deque()

        for node in current_level:  # Parcourir les noeuds du niveau
            if node is not None:
                val_str = str(node.val) if node.val is not None else "\t"
                level_str += "\t" + f"({val_str})"
                next_level.append(n_left(node))  # Remplir le niveau suivant avec les enfants
                next_level.append(n_right(node))

            else:  # S'il n'y a pas de noeud => tab
                next_level.append(n_left(node))
                next_level.append(n_right(node))
                r = next_level.index(node)
                level_str += "\t"

            level_str += " "

        result.append(level_str)  # Supprime l'espace à la fin de la ligne

        current_level = [node for node in next_level if node is not None]

    return "\n".join(result)


# print(bt_str(bt))


# Exercice 3

from typing import TypeAlias

BSTree: TypeAlias = BinaryTree


def bt_is_bst(bt: BinaryTree) -> bool:
    l = []
    parcours = parcours_infixe(bt_root(bt), l)

    k = []
    parcours_infixe_trié = parcours_infixe(bt_root(bt), k)
    parcours_infixe_trié.sort()

    return parcours_infixe_trié == parcours


def parcours_infixe(n: Node, l: list) -> bool:  # si on a deja explorer tout ce qu'il
    if n is not None:                           # yavait à gauche du neoud courant on va à droite
        parcours_infixe(n_left(n), l)
        if n is not None:
            l.append(n_get(n))
        parcours_infixe(n_right(n), l)
    return l


bt_int = bt = BinaryTree(Node(6, Node(2, Node(1), Node(4, Node(3))),
                              Node(11, Node(7), Node(12, Node(12), Node(14)))))

print(parcours_infixe(bt.root, l=[]))


def parcours_largeur_list(bt: BinaryTree):
    result = []
    root = bt.root
    if root is None:
        return result

    queue = deque([root])

    while queue:
        current_node = queue.popleft()  # deque.popleft() Retire et renvoi l'élément le + à gauche de la file
        result.append(current_node.val)

        if current_node.left:
            queue.append(current_node.left)
        if current_node.right:
            queue.append(current_node.right)

    return result


# nodes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# bt = bt_new(nodes)


ABR = BinaryTree(Node(6, Node(2, Node(1), Node(4, Node(3))),
                      Node(11, Node(7), Node(12, Node(12), Node(14)))))
print(parcours_largeur_list(ABR))


def bst_lookup(bst: BSTree, key: int) -> Node | None:
    node = bst_lookup_recherche(bst.root, key)
    return node


def bst_lookup_recherche(current_node: Node, key: int) -> Node | None:
    if current_node is not None:

        if key > n_get(current_node):
            bst_lookup_recherche(n_right(current_node), key)
        elif key < n_get(current_node):
            bst_lookup_recherche(n_left(current_node), key)
        elif key == n_get(current_node):
            return current_node


ABR = BinaryTree(Node(6, Node(2, Node(1), Node(4, Node(3))),
                      Node(11, Node(7), Node(12, Node(12), Node(14)))))

#print(bst_lookup(ABR, 12))


def bst_insert(bst: BSTree, key: int) -> Node:
    if bst.root is None:
        return bst(Node(key,None,None))
    else:
        bst_insert_recherche(bst.root, key)
        return bst


def bst_insert_recherche(node: Node, key: int) -> Node:
    if key < node.val:
        if node.left is None:
            node.left = Node(key,None,None)
            return node.left
        else:
            return bst_insert_recherche(node.left, key)

    elif key > node.val:
        if node.right is None:
            node.right = Node(key,None,None)
            return node.right
        else:
            return bst_insert_recherche(node.right, key)
    else:  # key = node.val, ignorer
        return node


print(ABR)
#print(bst_insert(ABR,8))


def bst_remove(bst: BSTree, key: int) -> BSTree:
    if bst.root is None:
        return bst
    else:
        return bst_remove_recursive(bst.root,key)


def bst_remove_recursive(current_node: Node, key: int) -> Node | None :
    if current_node is None:
        return None

    if key < n_get(current_node):
        current_node.left = bst_remove_recursive(current_node.left,key)  #  On modifie l'arbre à cet endroit avec les return d'après
    elif key > n_get(current_node):
        current_node.right = bst_remove_recursive(current_node.right, key)   #  On modifie l'arbre à cet endroit
    else:   #  key = current_node.val
        if current_node.left is None:
            return current_node.right
        elif current_node.right is None:
            return current_node.left
        current_node.val = bst_find_min(current_node.right)
        current_node.right = bst_remove_recursive(current_node.right, current_node.val)
    return current_node


def bst_find_min(node: Node) -> int:
    while node.left is not None:
        node = node.left
    return node.val




#print(bst_remove(ABR, 2))
#print(bt_is_bst(ABR))


def reverse_tree_recursive(current_node: Node)->Node:
    if current_node is None:
        return
    else:
        reverse_tree_recursive(current_node.left)
        reverse_tree_recursive(current_node.right)

        current_node.left, current_node.right = current_node.right, current_node.left

    return current_node


def reverse_tree(bt: BinaryTree) -> BinaryTree:
    return BinaryTree(reverse_tree_recursive(bt.root))


print(ABR)
print("inverse : ", reverse_tree(ABR))





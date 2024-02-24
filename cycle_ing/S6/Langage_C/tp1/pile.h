// Fichier qui définit la pile

#define TAILLE_PILE 50
#define TAILLE_CHAINE 20

struct SPile{
    char Tab[TAILLE_PILE][TAILLE_CHAINE];
    int pos;
};

void PileInit(struct SPile *pile);
void PilePush(struct SPile *pile, char *elem);
char* PileTop(struct SPile *pile);
char* PilePop(struct SPile *pile);
int PileTaille(struct SPile *pile);

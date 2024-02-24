#include "automate.c"
#include "pile.c"
#include "sgml.c"

int main() {
    FILE *fp;
    enum ETagEtat tagEtat;
    char tag[20];
    int erreur;

    struct SPile maPile;
    PileInit(&maPile);

    if ((fp = fopen("fichier.html","rt")) != NULL) {
        erreur = 0;
        while (!erreur) {
            if (TagSGML(fp, tag, &tagEtat) != 0) {
                erreur = 1;
                printf("Erreur de parsing")
            } else {
                switch (tagEtat) {
                    case ETEnoTag:
                        fin =1;
                        break;

                    case ETEopen:
                        PilePush(&maPile, tag);
                        break;

                    case ETEclose:
                        if (strcmp(PileTop(&maPile), tag) == 0) {
                            PilePop(&maPile);
                        } else {
                            erreur = 1;
                            printf("erreur")
                        }
                        break;

                }
            }
        }
    }
}

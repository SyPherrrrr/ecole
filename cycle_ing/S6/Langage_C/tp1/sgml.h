// Fichier header de la fonction sgml

enum ETagEtat {
    ETEnoTag,
    ETEopen,
    ETEclose
};

enum Etats {
    SEtatDebut = 0,
    SEtatTag = 1,
    SEtatTagOpen = 2,
    SEtatTagFDeb = 3,
    SEtatTagF = 4,
    SEtatFin = 5

};

int TagSGML(FILE *fp, char *tag, enum ETagEtat *tagEtat);


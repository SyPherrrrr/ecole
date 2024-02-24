 #include <stdio.h>

 int main () {

    FILE *pFile;
    char c;
    pFile=fopen("./tp1/fichier.html","rt");

    if (pFile) {
        for (c=fgetc(pFile);!feof(pFile);c=fgetc(pFile)) {  // Lecture caractère par caractère
            printf("%c",c);
        }

        fclose (pFile);
}
    else {
        printf("erreur d'ouverture du fichier\n");
    }
    return 0;
}

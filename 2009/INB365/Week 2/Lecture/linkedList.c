/* Program:  linkedList.c
 * Author:   Yuefeng Li
 * Purpose:  using a simple linked list
 *=========================================================*/
 
#include<stdlib.h>
#include<stdio.h>

struct list_el {
   int data;
   struct list_el *next;
};

typedef struct list_el item;

void print_list(struct list_el*);
 
void main() {
   item *curr, *head, *p;
   int i;

   head = NULL;

   for(i=1;i<=10;i++) {
      curr = (item *)malloc(sizeof(item));
      curr->data = i+100;
      curr->next  = head;
      head = curr;
   }
   p = head;
   print_list(p);
}
 void print_list(struct list_el *p) {
   if (p == NULL)
      printf("^\n");
   else 
   {
        while(p->next) {
                 printf("%d --> ", p->data);
                 p = p->next ;
        }
        printf("%d ^\n ", p->data);
   }
}


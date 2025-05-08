nclude <stdio.h>
#include <stdlib.h>

#define TABLE_SIZE 10

typedef struct Node {
    int* key;
      int* value;

        struct Node *next;
      } Node;

      typedef struct {
        Node **buckets;
      } Hashtable;


      int hash_func2(const int value) {
        // we need to check if there exists a value at the key,
          // if there is we need (value, 0) for the change
            return value % TABLE_SIZE;
              
          };
          int chain_input(const int value) {
            int position = hash_func(value);
              //get the node at the current value and 
                prev = get_node_from_value(position);
                  prev.next = Node{position, value}
                      return Node
                    }

                    Hashtable *create_hash_table() {
                      Hashtable *table = (Hashtable *)malloc(sizeof(Hashtable));
                        if (!table) {
                                perror("Hash table could neot be made\n");
                                      exit(EXIT_FAILURE);
                                        }
                                            
                                      }

                                      int main(int argc, char *argv[]) {
                                        if (argc != 2) {
                                                fprintf(stderr, "usage: main-first\n");
                                                      exit(1);
                                                        }
                                                            
                                                                

                                                                    return 0;
                                                                  }
                                                                  #! /bin/bash

sudo systemctl enable auto-cpufreq
sudo systemctl enable bluetooth
sudo systemctl enable bluetooth-autoconnect
sudo systemctl enable sshd
# sudo systemctl enable libvirtd
# sudo systemctl enable NetworkManager

# sudo systemctl enable docker
# sudo systemctl enable firewalld

# add user to video group enabling xbacklight
sudo gpasswd -a $(whoami) video

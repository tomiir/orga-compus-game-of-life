#include <stdbool.h>

#define TAG 4
#define TAG_MASK 0xF000


#define INDEX 5
#define INDEX_MASK 0xF80


#define OFFSET 7
#define OFFSET_MASK 0x7F

#define SET_NUM 32
#define WAY_NUM 4

#define BLOCK_SIZE 128
#define MEM_SIZE 65536



/* Memoria principal. */
typedef struct main_mem {
  unsigned char data [MEM_SIZE];
} main_mem;

typedef struct block {
    unsigned int sequence;
    bool valid;
    unsigned char tag;
    unsigned char data[BLOCK_SIZE];
}block;

struct set {
    struct block ways[WAY_NUM];
};
/**
 * Cache.
 * Tamaño: 16 KB.
 * Direcciones: 16 bits.
 * Conjuntos: 32.
 * Bloque: 128 bytes.
 * Vias: 4.
 * Tag: 4 bits.
 * Index: 5 bits.
 * Offset: 7 bits.
 */

typedef struct cache {
    unsigned int hits;
    unsigned int missses;
    unsigned int lru;
    struct set sets[SET_NUM];
} cache;
void init();
cache* init_cache();
main_mem* init_main_mem();

unsigned int get_offset(unsigned int address);
unsigned int find_set(unsigned int address);
unsigned int select_oldest(unsigned int setnum, cache* cache);
int compare_tag(unsigned int tag, unsigned int set, cache* cache);
void read_tocache(unsigned int blocknum, unsigned int way, unsigned int set, cache* cache, main_mem* main_mem);
unsigned char read_byte(unsigned int address, cache* cache, main_mem* mem);
void write_byte(unsigned int address, unsigned char value, cache* cache, main_mem* main_mem);
float get_miss_rate(cache* cache);

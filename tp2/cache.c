#include "cache.h"
#include "string.h"
#include "stdio.h"

void init_cache() {
    cache.hits = 0;
    cache.missses = 0;
    cache.lru = 0;
    for (int i = 0; i < SET_NUM; i++) {
        for (int j = 0; j < WAY_NUM; j++) {
            cache.sets[i].ways[j].valid = false;
            cache.sets[i].ways[j].sequence = 0;
        }
    }
}

void init_main_mem() {
     memset(main_mem.data, 0, sizeof main_mem);
}

void init(){
    init_cache();
    init_main_mem();
}

unsigned int get_offset(unsigned int address) {
    return address & OFFSET_MASK;
}

unsigned int find_set(unsigned int address) {
    return (address & INDEX_MASK) >> OFFSET;
}

unsigned int get_tag(unsigned int address) {
    return address >> (OFFSET + INDEX);
}

// REVISAR
unsigned int get_blocknum(unsigned int address) {
    return address >> OFFSET;
}

unsigned int select_oldest(unsigned int setnum) {
    unsigned int way = 0;
    unsigned int min = cache.sets[setnum].ways[way].sequence;
    for (int i = 1; i < WAY_NUM; i++) {
        if (cache.sets[setnum].ways[i].sequence < min) {
            min = cache.sets[setnum].ways[i].sequence;
            way = i;
        }
    }
    return way;
}

int compare_tag(unsigned int tag, unsigned int set) {
  for (int i = 0; i < WAY_NUM; i++) {
    struct block way = cache.sets[set].ways[i];
    if (tag == way.tag) {
      return 0;
    }
  }
  return -1;
}

void read_tocache(unsigned int blocknum, unsigned int way, unsigned int set) {

  struct block block = cache.sets[set].ways[way];
  unsigned int block_address = blocknum * BLOCK_SIZE;
  for (unsigned char i = 0; i < BLOCK_SIZE; i++) {
    block.data[i] = main_mem.data[block_address + i];
    //printf("Valor del bloque de cache en: %d segun read_tocache: %d\n", i, block.data[i]);
  }
  block.sequence = ++cache.lru;
  block.valid = true;
  block.tag = get_tag(block_address);
  cache.sets[set].ways[way] = block;
}


unsigned char read_byte(unsigned int address) {
  unsigned int set = find_set(address);
  unsigned int tag = get_tag(address);
  unsigned int offset = get_offset(address);
  //printf("Address: %d - %d %d %d  \n", address,tag,set,offset);
  // Vemos si hay un hit
  for (int i = 0; i < WAY_NUM; i++) {
    struct block block = cache.sets[set].ways[i];
    if (block.valid && block.tag == tag) {
      cache.hits++;
      return block.data[offset];
    }
  }
  // Miss => cargo el bloque y devuelvo el dato.
  cache.missses++;
  unsigned int way = select_oldest(set);
  read_tocache(get_blocknum(address), way, set);
  return cache.sets[set].ways[way].data[offset];
}

void write_tomem(unsigned int address, unsigned char value) {
  main_mem.data[address] = value;
}

void write_byte(unsigned int address, unsigned char value) {
    unsigned int set = find_set(address);
    unsigned int tag = get_tag(address);
    unsigned int offset = get_offset(address);

    for (int i = 0; i < WAY_NUM; i++) {
      struct block block = cache.sets[set].ways[i];
      // HIT
      if (block.valid && block.tag == tag) {
        cache.hits++;
        block.data[offset] = value;
        write_tomem(address, value);
        return;
      }
    }

    // El dato no se encuentra en cache => cargo el bloque y lo escribo.
    cache.missses++;
    write_tomem(address, value);
}

float get_miss_rate() {
    return (float) cache.missses / (float) (cache.hits + cache.missses);
}
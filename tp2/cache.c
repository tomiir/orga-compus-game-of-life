#include "cache.h"
#include "string.h"
#include "stdio.h"

cache* init_cache() {
  cache* cache = malloc(sizeof(cache));
    cache->hits = 0;
    cache->missses = 0;
    cache->lru = 0;
    for (int i = 0; i < SET_NUM; i++) {
        for (int j = 0; j < WAY_NUM; j++) {
            cache->sets[i].ways[j].valid = false;
            cache->sets[i].ways[j].sequence = 0;
        }
    }
    return cache;
}

main_mem* init_main_mem() {
    main_mem* mem = malloc(sizeof(main_mem));
    return mem;
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
    printf("print tag %d \n", address >> (OFFSET + INDEX));
    return address >> (OFFSET + INDEX);
}

// REVISAR
unsigned int get_blocknum(unsigned int address) {
    return address >> OFFSET;
}

unsigned int select_oldest(unsigned int setnum, cache* cache) {
    unsigned int way = 0;
    unsigned int min = cache->sets[setnum].ways[way].sequence;
    for (int i = 1; i < WAY_NUM; i++) {
      printf("cache.sets[setnum].ways[i].sequence: %d \n", cache->sets[setnum].ways[i].sequence);
        if (cache->sets[setnum].ways[i].sequence < min) {
            min = cache->sets[setnum].ways[i].sequence;
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

void read_tocache(unsigned int blocknum, unsigned int way, unsigned int set, cache* cache, main_mem* main_mem) {
 // VER SI HAY QUE PEDIR MEM PARA EL BLOQUE
  struct block block = cache->sets[set].ways[way];
  unsigned char block_address = blocknum * BLOCK_SIZE;
  for (int i = 0; i < BLOCK_SIZE; i++) {
    block.data[i] = main_mem->data[block_address + i];
  }
  block.sequence = ++cache->lru;
  block.valid = true;
  block.tag = get_tag(block_address);
}


unsigned char read_byte(unsigned int address, cache* cache, main_mem* mem) {
  unsigned int set = find_set(address);
  unsigned int tag = get_tag(address);
  unsigned int offset = get_offset(address);
  
  // Vemos si hay un hit
  for (int i = 0; i < WAY_NUM; i++) {
    // VER SI HAY QUE PEDIR MEM PARA EL BLOQUE
    struct block block = cache->sets[set].ways[i];
    printf("tag: %d \n", block.tag);
    if (block.valid && block.tag == tag) {
      cache->hits++;
      return block.data[offset];
    }
  }
  // Miss => cargo el bloque y devuelvo el dato.
  cache->missses++;
  unsigned int way = select_oldest(set, cache);
  read_tocache(get_blocknum(address), way, set, cache, mem);
  printf("fue un miss: %c", cache->sets[set].ways[way].data[offset]);
  return cache->sets[set].ways[way].data[offset];
}

void write_tomem(unsigned int address, unsigned char value, main_mem* main_mem) {
  main_mem->data[address] = value;
}

void write_byte(unsigned int address, unsigned char value, cache* cache, main_mem* main_mem) {
    unsigned int set = find_set(address);
    unsigned int tag = get_tag(address);
    unsigned int offset = get_offset(address);
    for (int i = 0; i < WAY_NUM; i++) {
      // VER SI HAY QUE PEDIR MEM PARA EL BLOQUE
      struct block block = cache->sets[set].ways[i];
      // HIT
      if (block.valid && block.tag == tag) {
        cache->hits++;
        block.data[offset] = value;
        write_tomem(address, value, main_mem);
        return;
      }
    }

    // El dato no se encuentra en cache => cargo el bloque y lo escribo.
    cache->missses++;
    write_tomem(address, value, main_mem);
}

float get_miss_rate(cache* cache) {
    return (float) cache->missses / (float) (cache->hits + cache->missses);
}
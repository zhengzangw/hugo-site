---
title: Chapter 4
date: 2018-11-13
tags: [ics, notes]
weight: 4
---

## 编译汇编过程

  Preprocessor: cpp / gcc -E -o main.i main.c  
  Compile: ccl / gcc -S -o main.s main.i  
  Assemble: as / gcc -c -o main.o main.s  
  Relocatable object file: .o

  vim :%!xxd (-r) 查看二进制文件  
  file:查看文件类型  
  strip -s: 丢弃符号信息

## 生成可执行文件

  符号解析：将每个符号引用于符号定义关联  
  relocation：根据ABI规范确定的memory mapping确定位置  

## ELF详解

readelf -a

### Object File Format

* DOS - COM
* System V UNIX - COFF (Common Object File-Format)
* Windows - PE (Portable Executable)
* Linux - ELF (Executable and * Linkable Format)

### Ehdr (ELF header)

  readelf -h  
  32 - 52bit, 64 - 64bit

* e_indent:
  * 4: EI_MAG 0x7F E L F
  * 1: EI_CLASS architecture 32/64
  * 1: EI_DATA data encoding LSB/MSB
  * 1: EI_VERSION ELF specification version
  * 1: EI_OSABI ABI
  * 1: EI_ABIVERSION
  * 1: EI_PAD reserved to be 0
  * 1: EI_NINDENT size of e_ident
* e_type: object file type (ET_REL/EXEC/DYN/CORE)
* e_machine: EM_386/EM_MIPS/EM_X86_64
* e_version: file version
* e_entry
* e_phoff: program header table's file offset
* e_shoff: section header table's file offset
* e_flags
* e_ehsize: ELF header's size
* e_phentsize: one entry size of ph
* e_phnum: number of ph
* e_shentsize
* e_shnum
* e_shstrndx: the section header index of the entry associated with the section name string table.

### shdr (Section header)

  readelf -S  
  32 - 40bits 

* sh_name: an index into shstrtab
* sh_type: 
  * SHT_NULL: inactive
  * SHT_PROGBITS: info defined by program, which format and meaning are determined solely by the program
  * SHT_SYMTAB: symbol table
  * SHT_STRTAB: string table
  * SHT_RELA: relocation entries with explicit addends
  * SHT_REL: relocation entries without explicit addends
  * SHT_HASH: symbol hash table
  * SHT_DYNAMIC
  * SHT_NOTE
* sh_flags: write, executable, alloc
* sh_addr: If this section appears in the memory image of a process, it is the address at which the section's first byte reside
* sh_offset: offset in the file
* sh_size
* sh_link
* sh_info
* sh_addralign
* sh_entsize
  
### Section

* .bss: uninitialized data (SHT_NOBITS)
* .comment: version control infomation
* .ctors: uninitialized pointers to C++ constructor functions (SHT_NOBITS)
* .data: initialized data
* .data1: same as above
* .debug: info for symbolic debugging
* .dtors: initialized pointers
* .dynamic
* .dynstr
* .dynsym
* .fini: executables instructions contributing to the process termination code
* .gnu.version \ .gnu.version_d \ .gnu.version_r
* .got: global offset table
* .hash: symbol has table
* .init
* .interp: program interpreter 包含动态连接器路径名
* .line: line number infomation for symbolic debugging
* .note \ .note.gnu.build-id \ .note.GNU-stack
* .plt procedure linkage table
* .relNAME holds relocation information
* .relaNAME 
* .rodata \ .rodata1
* .shstrtab: holds section names
* .strtab: strings table
* .symtab: symbol table
* .text 0x08048000

### Symbol Tables

readelf -s

* st_name: index into the object file's str tab
* st_value: value or index into its section
* st_size 
* st_info: type
  * BIND 4 low bits
    * STB_LOCAL
    * STB_GLOBAL
    * STB_WEAK
  * TYPE 4 high bits
    * NOTYPE
    * OBJECT
    * FUNC
    * SECTION
    * FILE
* st_other: symbol visibility
* st_shndx: index into section header table

### 符号解析过程

  E,U,D  
  nm 查看符号表  
  ar -rv 存档文件
  gcc -static

### Phdr (Program header)

  readelf -l  

* p_type: 
  * PT_NULL
  * PT_LOAD
  * PT_DYNAMIC
  * PT_INTERP
  * PT_GNU_STACK
* p_offset
* p_vaddr
* p_paddr: often invalid
* p_filesz: number of bytes in the file image of the segment
* p_memsz: in the memory
* p_flags: x,w,r
* p_align

### Relocation entries

relNAME:

* r_offset: the location at which to apply the relocation action
* r_info:
  * high 24: r_sym, the index into symtab
  * low 8: r_type:
    * R_386_PC32: 重定位值 = 转移目标地址 - PC(next instruction) = ADDR(r_sym) - ((ADDR(.text) + r_offset) - init), init is the offset between the beginning of next instruction and the place need to be relocated
    * R_386_32: 重定位值 = ADDR(r_sym)
    * R_386_GOT32

### Memory Mapping

* .text 0x8048000
* run-time heap: after RW segment 4KB
* run-time user stack: 0xC0000000
* 共享库： 0x40000000

  loader: UNIX - execve

## Dynamic 

* shared object file
* dynamic linker:
  * UNIX - .so
  * Windows - .dll (Dynamic Link Library)
* 共享库命名:
  * linker name
  * soname: 主版本号
  * real name: 完整版本号
* 生成共享库 gcc -shared -fPIC 
* 加载器 execve
* 动态连接器 ld-linux.so
* Idd 模拟运行
  
### 运行时动态链接

  gcc -rdynamic -ldl  
  \<dlfcn.h\>

* `void *handle = dlopen("./mylib.so", RTLD_LAZY`
* `void (*myfunc1)() = dlsym(handle, "myfunc1")`
* `myfunc1()`
* `dlclose(handle)`
* `fprintf(stderr, "%s\n", dlerror())`

### PIC (Position-Independent Code)

* 模块内过程跳转 PC相对寻址
* 模块内数据引用 __get_pc获得引用a的地址，基址加偏移量得到a的地址
* 模块间数据引用 GOT (Global Offset Table)
* 模块间过程跳转 朴素多3条；延迟绑定：
  * PLT (Procedure Linkage Table)
  * PLT[0] 以GOT[2]为参数，调用GOT[1]
  * PLT[1+i] 第i个外部参数的调用指令(3)
  * GOT[0] .dynamic节首址
  * GOT[1] 动态链接器标识信息
  * GOT[2] 延迟绑定代码入口地址
  * GOT[3+i] 第i个外部函数地址（一次访问PLT[0]后获得）

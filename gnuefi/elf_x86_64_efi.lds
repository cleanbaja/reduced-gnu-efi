OUTPUT_FORMAT(elf64-x86-64)
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)

PHDRS
{
    null    PT_NULL    FLAGS(0) ;
    segm    PT_LOAD    FLAGS(7) ;
    dynamic PT_DYNAMIC FLAGS(7) ;
}

SECTIONS
{
    . = 0;
    __image_base = .;
    __image_size = __image_end - __image_base;

    .sect : {
        *(.pe_header)

        . = ALIGN(0x1000);

        __text_start = .;
        __text_size = __text_end - __text_start;
        __text_sizev = __text_endv - __text_start;
        *(.text .text.*)
        __text_endv = .;
        . = ALIGN(0x1000);
        __text_end = .;

        __reloc_start = .;
        __reloc_size = __reloc_end - __reloc_start;
        __reloc_sizev = __reloc_endv - __reloc_start;
        *(.reloc)
        __reloc_endv = .;
        . = ALIGN(0x1000);
        __reloc_end = .;

        __sbat_start = .;
        __sbat_size = __sbat_end - __sbat_start;
        __sbat_sizev = __sbat_endv - __sbat_start;
        *(.sbat)
        __sbat_endv = .;
        . = ALIGN(0x1000);
        __sbat_end = .;

        __data_start = .;
        __data_size = __data_end - __data_start;
        *(.rodata .rodata.*)
        *(.data .data.*)
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(0x1000);
    } :segm

    .rela : {
        *(.rela .rela.*)
        . = ALIGN(0x1000);
    } :segm

    .got : {
        *(.got .got.*)
        . = ALIGN(0x1000);
    } :segm

    .dynamic : {
        __dynamic = .;
        *(.dynamic)
        . = ALIGN(0x1000);
    } :segm :dynamic

    __data_end = .;
    __image_end = .;

    .symtab 0 : {
        *(.symtab)
    } :null

    .strtab 0 : {
        *(.strtab)
    } :null

    .shstrtab 0 : {
        *(.shstrtab)
    } :null

    .debug_aranges 0 : {
        *(.debug_aranges)
    } :null

    .debug_pubnames 0 : {
        *(.debug_pubnames)
    } :null

    .debug_info 0 : {
        *(.debug_info)
    } :null

    .debug_abbrev 0 : {
        *(.debug_abbrev)
    } :null

    .debug_line 0 : {
        *(.debug_line)
    } :null

    .debug_loclists 0 : {
        *(.debug_loclists)
    } :null

    .debug_rnglists 0 : {
        *(.debug_rnglists)
    } :null

    .debug_frame 0 : {
        *(.debug_frame)
    } :null

    .debug_loc 0 : {
        *(.debug_loc)
    } :null

    .debug_ranges 0 : {
        *(.debug_ranges)
    } :null

    .debug_str 0 : {
        *(.debug_str)
    } :null

    .debug_line_str 0 : {
        *(.debug_line_str)
    } :null

    /DISCARD/ : {
        *(*)
    }
}

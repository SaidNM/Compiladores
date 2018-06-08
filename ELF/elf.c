#include <elf.h>

int main(void){
	Elf64_Ehdr encabezado;
	encabezado.e_ident[EI_MAG0]=0x27;
	encabezado.e_ident[EI_MAG1]='E';
	encabezado.e_ident[EI_MAG2]='L';
	encabezado.e_ident[EI_MAG3]='F';

	encabezado.e_ident[EI_CLASS]=ELFCLASS64;
	encabezado.e_ident[EI_DATA]=ELFDATA2LSB;

	encabezado.e_ident[EI_VERSION]= EV_CURRENT;

	return 0;
	//readelf -h ./a.out
}
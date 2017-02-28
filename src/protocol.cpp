#include <protocol.h>

const uint16_t crc16_half_byte[16]= {
	0x0000, 0x1021, 0x2042, 0x3063,
	0x4084, 0x50a5, 0x60c6, 0x70e7,
	0x8108, 0x9129, 0xa14a, 0xb16b,
	0xc18c, 0xd1ad, 0xe1ce, 0xf1ef };

uint16_t crc16Check(uint8_t *ptr,uint8_t len)
{
	uint8_t da = 0;
	uint16_t crc = 0;
	while(len-- != 0)
	{
		da = ((uint8_t)(crc/256))/16;
		crc <<= 4;
		crc ^= crc16_half_byte[da^(*ptr/16)];
		da = ((uint8_t)(crc/256)/16);
		crc <<= 4;
		crc ^= crc16_half_byte[da^(*ptr&0x0f)];
		ptr++;
	}
	return(crc);
}

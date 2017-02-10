#pragma once 

class REVOMINI::_parser { // universal parser interface
public:
    _parser() {};
    virtual ~_parser() {};
    virtual void init(uint8_t ch) =0;
    virtual uint64_t get_last_signal()=0;
    virtual uint64_t get_last_change()=0;
    virtual uint8_t  get_valid_channels()=0;
    virtual uint16_t get_val(uint8_t ch)=0;
    virtual bool bind(int dsmMode) { return true; }
};

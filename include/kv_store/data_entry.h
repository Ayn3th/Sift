// Copyright 2019 Mikhail Kazhamiaka
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#pragma once

#include "common/common.h"

#include <stdint.h>

class DataEntry {
public:
    DataEntry();

    void setKey(const char*);
    void setValue(const char*);
    void setNextPtr(uint64_t);

    char *getKey();
    char *getValue();
    uint64_t getNextPtr();

    char *serialize();
    void deserialize(const char *);

    struct {
        char key[KV_KEY_SIZE];
        char value[KV_VALUE_SIZE];
        uint64_t next_ptr;
    } entry;
};

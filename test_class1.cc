#include <gtest/gtest.h>

#define private public
#define protected public

#include "class1.h"

TEST(test1, test2)
{
    EXPECT_EQ(0, 0);
}


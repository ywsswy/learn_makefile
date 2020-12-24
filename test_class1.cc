#include <gtest/gtest.h>
#include <gmock/gmock.h>

#define private public
#define protected public

#include "class1.h"
class MockClass1 : public Class1
{
public:
    MOCK_METHOD1(NetReq, int(int));
};

TEST(test1, test2)
{
    MockClass1 *c = new MockClass1();
    EXPECT_CALL(*c, NetReq(testing::_))
        .Times(testing::AtLeast(0))
        .WillRepeatedly(testing::Return(666));
    c->SayName();
    delete c;
}


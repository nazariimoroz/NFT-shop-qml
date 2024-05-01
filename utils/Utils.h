//
// Copyright 2024 Nazarii Moroz
//

#ifndef PAYMENTS_SYSTEM_UTILS_H
#define PAYMENTS_SYSTEM_UTILS_H


#define TO_STR(TO_CONV) #TO_CONV
#define TO_STR_COV(TO_CONV) TO_STR(TO_CONV)

#define PS_INFO(MSG)\
    {QDebug(QtInfoMsg) << (__FILE__ "(" TO_STR_COV(__LINE__) ")" ": " MSG);} (void)0

#define PS_ERROR(MSG)\
    {QDebug(QtCriticalMsg) << (__FILE__ "(" TO_STR_COV(__LINE__) ")" ": " MSG);} (void)0

#define PS_CHECK_RETURN(COND, TO_RET)                                                   \
    if(!(COND))                                                                         \
    {                                                                                   \
        PS_ERROR(#COND);                                                                \
        return TO_RET;                                                                  \
    }(void)0

#define PS_CHECK(COND) PS_CHECK_RETURN(COND, )

namespace Utils
{

}

#endif //PAYMENTS_SYSTEM_UTILS_H

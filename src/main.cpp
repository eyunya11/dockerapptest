#include "hello_world.h"
#include "iostream"
#include <cstdlib>
#include <ctime>

int main()
{
    // 乱数シードを初期化
    std::srand(std::time(nullptr));

    while (true)
    {
        int range;
        std::cout << "範囲を入力してください" << std::endl;
        std::cin >> range;
        std::cout << rand() % range << std::endl;
    }
}
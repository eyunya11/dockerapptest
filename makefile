CXX = g++
CXXFLAGS = -g
INCLUDES = -Iinclude

# ソースファイルの自動検出
PROJECT_ROOT = .
SRC_ROOT = src

# ソースファイルの自動検出
SRC_DIR = $(PROJECT_ROOT)/$(SRC_ROOT)
SRC = $(shell find $(SRC_DIR) -type f -name "*.cpp")

# オブジェクトファイルのリストを生成
OBJ = $(SRC:.cpp=.o)

# 実行ファイル名
TARGET = hello_world

# デフォルトのターゲット
all: $(TARGET)

# 実行ファイルの生成ルール
$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

# オブジェクトファイルの生成ルール

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INCLUDES)

# クリーンアップ
clean:
	rm -f $(OBJ) $(TARGET)
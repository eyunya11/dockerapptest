# コンパイラとフラグ
CXX = g++
CXXFLAGS = -g
PROJECT_ROOT = .
INCLUDE_ROOT = include
SRC_ROOT = src
OBJ_ROOT = obj

# 実行ファイル名
TARGET = hello_world_d

# インクルードフォルダパス
INCLUDE_DIRS = $(shell find $(PROJECT_ROOT)/$(INCLUDE_ROOT) -type d)
INCLUDES = $(addprefix -I, $(INCLUDE_DIRS))

# ソースファイルの自動検出
SRC_DIR = $(PROJECT_ROOT)/$(SRC_ROOT)
SRC = $(shell find $(SRC_DIR) -type f -name "*.cpp")

# オブジェクトファイルのリストを生成
OBJ_DIR = $(PROJECT_ROOT)/$(OBJ_ROOT)
OBJ = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRC))

# デフォルトのターゲット
all: $(TARGET)

# 実行ファイルの生成ルール
$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

# オブジェクトファイルの生成ルール
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INCLUDES)

# クリーンアップ
clean:
	rm -f $(OBJ) $(TARGET)
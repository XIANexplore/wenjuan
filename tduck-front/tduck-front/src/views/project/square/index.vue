<template>
  <div class="project-square-container">
    <!-- 顶部导航栏 -->
    <div class="top-nav">
      <div class="logo">
        <img src="~@/assets/images/custom-logo.svg" @click="goToHome" />
      </div>
      <div class="nav-actions">
        <el-button type="text" @click="goToLogin" v-if="!isLoggedIn">登录</el-button>
        <el-button type="primary" @click="goToHome" v-if="isLoggedIn">我的项目</el-button>
      </div>
    </div>

    <div class="header">
      <h2>问卷广场</h2>
      <p>这里展示了所有可以回答的问卷，选择一个开始填写吧！</p>
    </div>

    <div v-if="loading" class="loading-container">
      <el-skeleton :rows="6" animated />
    </div>

    <div v-else-if="formList.length === 0" class="empty-container">
      <el-empty description="暂无可填写的问卷"></el-empty>
    </div>

    <el-row :gutter="20" v-else>
      <el-col v-for="form in formList" :key="form.id" :xs="24" :sm="12" :md="8" :lg="6">
        <el-card class="form-card" shadow="hover">
          <div class="form-title">{{ form.textName || form.name }}</div>
          <div class="form-desc">{{ form.description || '暂无描述' }}</div>
          <div class="form-footer">
            <el-button type="primary" size="small" @click="goToWriteForm(form.formKey)">开始填写</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <div class="pagination-container" v-if="total > 0">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="pageSize"
        :current-page.sync="currentPage"
        @current-change="handlePageChange"
      ></el-pagination>
    </div>
  </div>
</template>

<script>
import { getRequest } from '@/api/baseRequest'
import Cookies from 'js-cookie'

export default {
  name: 'ProjectSquare',
  data() {
    return {
      formList: [],
      total: 0,
      pageSize: 12,
      currentPage: 1,
      loading: true,
      isLoggedIn: false
    }
  },
  created() {
    this.checkLoginStatus()
    this.fetchFormList()
  },
  methods: {
    checkLoginStatus() {
      const token = Cookies.get('token')
      this.isLoggedIn = !!token
    },
    fetchFormList() {
      this.loading = true
      getRequest('/user/form/public/list', {
        page: this.currentPage,
        size: this.pageSize
      })
        .then((res) => {
          if (res.code === 200) {
            this.formList = res.data.records || []
            this.total = res.data.total || 0
          } else {
            this.$message.error('获取问卷列表失败')
            this.formList = []
            this.total = 0
          }
        })
        .catch((err) => {
          console.error('获取问卷列表出错:', err)
          this.$message.error('获取问卷列表出错')
          this.formList = []
          this.total = 0
        })
        .finally(() => {
          this.loading = false
        })
    },
    handlePageChange(page) {
      this.currentPage = page
      this.fetchFormList()
    },
    goToWriteForm(formKey) {
      this.$router.push(`/s/${formKey}`)
    },
    goToHome() {
      if (this.isLoggedIn) {
        this.$router.push('/home')
      } else {
        this.$router.push('/')
      }
    },
    goToLogin() {
      this.$router.push('/login')
    }
  }
}
</script>

<style lang="scss" scoped>
.project-square-container {
  padding: 20px;

  .top-nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    margin-bottom: 20px;
    border-bottom: 1px solid #eaeaea;

    .logo {
      img {
        height: 40px;
        cursor: pointer;
      }
    }

    .nav-actions {
      display: flex;
      gap: 10px;
    }
  }

  .header {
    text-align: center;
    margin-bottom: 30px;

    h2 {
      font-size: 28px;
      color: #303133;
      margin-bottom: 10px;
    }

    p {
      font-size: 16px;
      color: #606266;
    }
  }

  .loading-container,
  .empty-container {
    padding: 40px 0;
    text-align: center;
  }

  .form-card {
    height: 180px;
    margin-bottom: 20px;
    display: flex;
    flex-direction: column;

    .form-title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
      color: #303133;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .form-desc {
      font-size: 14px;
      color: #606266;
      flex: 1;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
    }

    .form-footer {
      margin-top: 15px;
      text-align: right;
    }
  }

  .pagination-container {
    text-align: center;
    margin-top: 30px;
  }
}
</style>

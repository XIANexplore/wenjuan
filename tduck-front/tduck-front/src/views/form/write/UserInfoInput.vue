<template>
  <div class="user-info-input">
    <el-form :model="userInfo" :rules="rules" ref="userInfoForm" label-width="80px">
      <el-form-item label="姓名" prop="userName">
        <el-input v-model="userInfo.userName" placeholder="请输入您的姓名"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="userEmail">
        <el-input v-model="userInfo.userEmail" placeholder="请输入您的邮箱"></el-input>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: 'UserInfoInput',
  data() {
    return {
      userInfo: {
        userName: '',
        userEmail: ''
      },
      rules: {
        userName: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
        userEmail: [
          { required: true, message: '请输入邮箱', trigger: 'blur' },
          { type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    validate() {
      return new Promise((resolve, reject) => {
        this.$refs.userInfoForm.validate((valid) => {
          if (valid) {
            resolve(this.userInfo)
          } else {
            reject('请填写正确的用户信息')
          }
        })
      })
    },
    resetForm() {
      this.$refs.userInfoForm.resetFields()
    }
  }
}
</script>

<style lang="scss" scoped>
.user-info-input {
  margin-bottom: 20px;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 4px;
}
</style>

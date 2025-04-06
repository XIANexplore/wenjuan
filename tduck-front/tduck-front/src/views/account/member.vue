<template>
  <div class="member-container">
    <el-card class="member-box-card">
      <div class="member-info-view">
        <h2 class="profile-title">个人信息</h2>
        <div v-if="userInfo" class="profile-content">
          <div class="profile-left">
            <div class="profile-item">
              <div class="profile-label">昵称</div>
              <div class="profile-value">
                <span>{{ userInfo.name }}</span>
                <el-button type="primary" size="small" round class="edit-btn" @click="editNameDialogVisible = true"
                  >修改</el-button
                >
              </div>
            </div>
            <div class="profile-item">
              <div class="profile-label">账号</div>
              <div class="profile-value">
                <span>{{ userInfo.email }}</span>
                <el-button type="primary" size="small" round class="edit-btn" @click="emailDialogVisible = true"
                  >绑定</el-button
                >
              </div>
            </div>
            <div class="profile-item">
              <div class="profile-label">密码</div>
              <div class="profile-value">
                <span>******</span>
                <el-button type="primary" size="small" round class="edit-btn" @click="pwdDialogVisible = true"
                  >修改</el-button
                >
              </div>
            </div>
            <div class="profile-item">
              <div class="profile-label">手机号</div>
              <div class="profile-value">
                <span>{{ userInfo.phoneNumber || '未绑定' }}</span>
                <el-button
                  v-if="userInfo.phoneNumber"
                  type="primary"
                  size="small"
                  round
                  class="edit-btn"
                  @click="phoneDialogVisible = true"
                  >修改</el-button
                >
                <el-button v-else type="primary" size="small" round class="edit-btn" @click="phoneDialogVisible = true"
                  >绑定</el-button
                >
              </div>
            </div>
          </div>
          <div class="profile-right">
            <div class="avatar-container">
              <my-upload
                v-model="showUploadAvatar"
                field="file"
                :width="300"
                :height="300"
                :url="getUploadUrl()"
                :headers="getUploadHeader()"
                img-format="png"
                @crop-upload-success="cropUploadSuccess"
              />
              <el-avatar class="profile-avatar" :src="userInfo.avatar" @click.native="showUploadAvatar = true" />
              <div class="avatar-overlay" @click="showUploadAvatar = true">
                <i class="el-icon-camera"></i>
                <span>更换头像</span>
              </div>
            </div>
          </div>
        </div>
        <h2 class="profile-title">第三方账号</h2>
        <div v-if="userInfo" class="third-party-accounts">
          <div class="third-party-item">
            <div class="third-party-icon">
              <font-icon class="fab fa-weixin" :class="{ connected: userInfo.wxName }" />
            </div>
            <div class="third-party-info">
              <div class="third-party-name">微信</div>
              <div class="third-party-status">
                <span v-if="userInfo.wxName" class="connected-text"
                  >{{ userInfo.wxName }} <i class="el-icon-check"></i
                ></span>
                <span v-else class="not-connected-text">未绑定</span>
              </div>
            </div>
            <div class="third-party-action">
              <el-button v-if="userInfo.wxName" type="info" size="small" round disabled>已绑定</el-button>
              <el-button v-else type="success" size="small" round @click="bindWxHandle">绑定</el-button>
            </div>
            <el-dialog title="微信扫描二维码绑定" width="400px" center :visible.sync="bindWxDialogVisible">
              <div class="qrcode-container">
                <el-image class="qrcode-image" :src="bindWxQrcode" fit="fill" />
                <p class="qrcode-tip">请使用微信扫描二维码完成绑定</p>
              </div>
            </el-dialog>
          </div>
        </div>
      </div>
    </el-card>
    <div>
      <el-dialog title="修改用户名" :visible.sync="editNameDialogVisible" width="450px" center>
        <el-form ref="updateNameForm" :model="userInfoForm" :rules="userInfoRules" label-width="80px">
          <el-form-item label="新用户名" prop="name">
            <el-input v-model="userInfoForm.name" />
          </el-form-item>
        </el-form>
        <span slot="footer">
          <el-button
            type="primary"
            @click="
              () => {
                this.$refs['updateNameForm'].validateField('name', (err) => {
                  if (!err) {
                    this.editNameDialogVisible = false
                    this.updateUserHandle()
                  }
                })
              }
            "
            >保存</el-button
          >
        </span>
      </el-dialog>
      <el-dialog title="修改密码" :visible.sync="pwdDialogVisible" width="450px" center>
        <el-form
          ref="updatePassWordForm"
          style="width: 300px"
          :model="userPwdForm"
          :rules="userPwdRules"
          label-width="120px"
        >
          <el-form-item label="输入旧密码" prop="oldPassword">
            <el-input v-model="userPwdForm.oldPassword" placeholder="请输入旧密码" show-password />
          </el-form-item>
          <el-form-item label="输入新密码" prop="password">
            <el-input v-model="userPwdForm.password" placeholder="请输入新密码" show-password />
          </el-form-item>
          <el-form-item label="重复输入密码" prop="repeatPassword">
            <el-input v-model="userPwdForm.repeatPassword" placeholder="请重复输入密码" show-password />
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button
            type="primary"
            @click="
              () => {
                this.pwdDialogVisible = false
                this.updateUserPwdHandle()
              }
            "
            >完 成</el-button
          >
        </span>
      </el-dialog>
      <el-dialog title="修改邮箱" :visible.sync="emailDialogVisible" width="450px" center>
        <el-form
          ref="updateEmailForm"
          style="width: 80%"
          :model="userInfoForm"
          :rules="userInfoRules"
          label-width="80px"
        >
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="userInfoForm.email" placeholder="请输入邮箱" />
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button
            v-prevent-re-click
            type="primary"
            @click="
              () => {
                this.pwdDialogVisible = false
                this.sendUpdateEmail()
              }
            "
            >发送验证邮件</el-button
          >
        </span>
      </el-dialog>
      <el-dialog title="修改手机号" :visible.sync="phoneDialogVisible" width="450px" center>
        <el-form ref="updatePhoneForm" :model="userInfoForm" :rules="userInfoRules" label-width="120px">
          <el-form-item label="手机号" prop="phoneNumber">
            <el-input v-model="userInfoForm.phoneNumber" placeholder="请输入手机号" />
          </el-form-item>
          <el-form-item label="输入验证码" prop="code">
            <el-input
              v-model="userInfoForm.code"
              placeholder="请输入验证码"
              style="display: inline-block; width: 60%"
            />
            <el-button
              v-prevent-re-click
              style="display: inline-block; width: 40%"
              @click.native="sendUpdatePhoneNumber"
            >
              {{ phoneValidateCodeBtnText }}
            </el-button>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button
            type="primary"
            @click="
              () => {
                this.phoneDialogVisible = false
                this.updateUserPhoneHandle()
              }
            "
            >完 成</el-button
          >
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import myUpload from 'vue-image-crop-upload'
import constants from '@/utils/constants'
import FontIcon from '@/components/FontIcon'
import { getCurrentDomain } from '@/utils'

export default {
  name: 'Member',
  components: {
    FontIcon,
    myUpload
  },
  data() {
    let validateRePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.userPwdForm.repeatPassword) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      memberMenuActive: '1',
      phoneValidateCodeBtnText: '发送验证码',
      userInfoRules: {
        name: [{ required: true, trigger: 'blur', message: '请输入昵称' }],
        email: [
          { required: true, trigger: 'blur', message: '请输入邮箱' },
          {
            pattern: /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/,
            message: '请输入正确的邮箱'
          }
        ],
        phoneNumber: [
          { required: true, trigger: 'blur', message: '请输入手机号' },
          {
            pattern: /^(?:0|86|\+86)?1[3456789]\d{9}$/,
            message: '请输入正确的手机号'
          }
        ],
        code: [{ required: true, trigger: 'blur', message: '请输入验证码' }]
      },
      userPwdRules: {
        oldPassword: [
          { required: true, trigger: 'blur', message: '请输入旧密码' },
          {
            pattern: constants.passwordReg,
            message: constants.passwordRegDesc
          }
        ],
        password: [
          { required: true, trigger: 'blur', message: '请输入新密码' },
          {
            pattern: constants.passwordReg,
            message: constants.passwordRegDesc
          }
        ],
        repeatPassword: [{ required: true, trigger: 'blur', validator: validateRePass }]
      },
      bindWxDialogVisible: false,
      bindWxQrcode: '',
      editNameDialogVisible: false,
      pwdDialogVisible: false,
      phoneDialogVisible: false,
      emailDialogVisible: false,
      userInfo: {},
      userInfoForm: {},
      qqLoginAuthorizeUrl: '',
      userPwdForm: {
        oldPassword: '',
        password: '',
        repeatPassword: ''
      },
      showUploadAvatar: false,
      bindWxTimer: null
    }
  },
  created() {
    this.queryUserInfo()
    this.getQQLoginAuthorizeUrl()
    this.getBindWxQrCode()
  },
  destroyed() {
    clearInterval(this.bindWxTimer)
  },
  methods: {
    queryUserInfo() {
      this.$api.get('/user/current/detail').then((res) => {
        if (res.data) {
          this.userInfo = res.data
          this.$store.dispatch('user/update', this.userInfo).then(() => {})
        }
      })
    },
    getUploadHeader() {
      return {
        token: this.$store.getters['user/isLogin']
      }
    },
    getUploadUrl() {
      return `${process.env.VUE_APP_API_ROOT}/user/file/upload`
    },
    getBindWxQrCode() {
      this.$api.get('/user/bind/wx/qrcode').then((res) => {
        this.bindWxQrcode = res.data
      })
    },
    updateUserPwdHandle() {
      this.$refs['updatePassWordForm'].validate((valid) => {
        if (valid) {
          this.$api.post('/user/update/password', this.userPwdForm).then((res) => {
            if (res.data) {
              this.msgSuccess('修改成功')
              this.queryUserInfo()
            }
          })
        } else {
          return false
        }
      })
    },
    sendUpdateEmail() {
      this.$refs['updateEmailForm'].validateField('email', (err) => {
        if (!err) {
          this.$api.get('/user/update-email/msg', { params: { email: this.userInfoForm.email } }).then((res) => {
            if (res.data) {
              this.msgSuccess('发送成功,请去您的邮箱查看')
              this.emailDialogVisible = false
            }
          })
        }
      })
    },
    sendUpdatePhoneNumber() {
      this.$refs['updatePhoneForm'].validateField('phoneNumber', (err) => {
        if (!err) {
          this.$api.get(`/user/update-phone/code?phoneNumber=${this.userInfoForm.phoneNumber}`).then(() => {
            this.msgSuccess('验证码发送成功，5分钟内有效')
            let count = 60
            let timer = setInterval(() => {
              count--
              this.phoneValidateCodeBtnText = count + 's后重新发送'
              if (count == 0) {
                this.phoneValidateCodeBtnText = '发送验证码'
                clearInterval(timer)
              }
            }, 1000)
          })
        }
      })
    },
    updateUserHandle() {
      this.$api.post('/user/update', this.userInfoForm).then((res) => {
        if (res.data) {
          this.msgSuccess('保存成功')
          this.queryUserInfo()
        }
      })
    },
    // qq登录授权地址
    getQQLoginAuthorizeUrl() {
      let reUrl = getCurrentDomain() + '/redirect/bindqq'
      this.$api.get('/login/qq/authorize/url', { params: { redirectUri: reUrl } }).then((res) => {
        this.qqLoginAuthorizeUrl = res.data
      })
    },
    redirectUrl(url) {
      window.open(url)
    },
    updateUserPhoneHandle() {
      this.$refs['updatePhoneForm'].validateField(['phoneNumber', 'code'], (err) => {
        if (!err) {
          this.$api.post('/user/update/phone-number', this.userInfoForm).then(() => {
            this.msgSuccess('修改成功')
            this.queryUserInfo()
          })
        }
      })
    },
    bindWxHandle() {
      this.bindWxDialogVisible = true
      this.bindWxTimer = setInterval(() => {
        this.$api.get('/user/current/detail').then((res) => {
          if (res.data) {
            let { wxName } = res.data
            if (wxName) {
              this.msgSuccess('绑定成功')
              clearInterval(this.bindWxTimer)
              this.userInfo.wxName = wxName
              this.bindWxDialogVisible = false
            }
          }
        })
      }, 5 * 1000)
    },
    cropUploadSuccess(res) {
      this.userInfoForm.avatar = res.data
      this.updateUserHandle()
    }
  }
}
</script>

<style lang="scss" scoped>
.member-container {
  display: flex;
  align-content: center;
  justify-content: center;
  padding: 20px 0;
  background-color: #f5f7fa;
  min-height: calc(100vh - 50px);
}

.member-box-card {
  margin-top: 20px;
  width: 900px;
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  overflow: hidden;

  &:hover {
    box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
  }
}

.member-info-view {
  padding: 20px;
}

.profile-title {
  color: #303133;
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 30px;
  position: relative;
  padding-left: 15px;

  &::before {
    content: '';
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 4px;
    height: 20px;
    background: linear-gradient(45deg, #1890ff, #36cfc9);
    border-radius: 2px;
  }
}

.profile-content {
  display: flex;
  justify-content: space-between;
  margin-bottom: 40px;
  animation: fadeIn 0.5s ease-out;
}

.profile-left {
  flex: 1;
  padding-right: 40px;
}

.profile-item {
  display: flex;
  align-items: center;
  margin-bottom: 25px;
  padding-bottom: 15px;
  border-bottom: 1px solid #f0f0f0;
  transition: all 0.3s ease;

  &:hover {
    transform: translateX(5px);
    border-bottom-color: #e6f7ff;
  }
}

.profile-label {
  width: 80px;
  color: #606266;
  font-size: 15px;
  font-weight: 500;
}

.profile-value {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;

  span {
    color: #303133;
    font-size: 15px;
  }

  .edit-btn {
    transition: all 0.3s ease;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(24, 144, 255, 0.15);
    }
  }
}

.profile-right {
  width: 180px;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding-top: 20px;
}

.avatar-container {
  position: relative;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  overflow: hidden;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);

    .avatar-overlay {
      opacity: 1;
    }
  }

  .profile-avatar {
    width: 120px !important;
    height: 120px !important;
  }

  .avatar-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    opacity: 0;
    transition: opacity 0.3s ease;

    i {
      font-size: 24px;
      color: white;
      margin-bottom: 5px;
    }

    span {
      color: white;
      font-size: 14px;
    }
  }
}

.third-party-accounts {
  padding: 10px 0 20px;
  animation: fadeIn 0.5s ease-out;
}

.third-party-item {
  display: flex;
  align-items: center;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  transition: all 0.3s ease;

  &:hover {
    background-color: #f0f7ff;
    transform: translateY(-3px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  }
}

.third-party-icon {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: #f0f0f0;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-right: 15px;

  .fa-weixin {
    font-size: 28px;
    color: #8c8c8c;

    &.connected {
      color: #07c160;
    }
  }
}

.third-party-info {
  flex: 1;
}

.third-party-name {
  font-size: 16px;
  font-weight: 500;
  color: #303133;
  margin-bottom: 5px;
}

.third-party-status {
  font-size: 14px;

  .connected-text {
    color: #52c41a;
    display: flex;
    align-items: center;

    i {
      margin-left: 5px;
    }
  }

  .not-connected-text {
    color: #bfbfbf;
  }
}

.qrcode-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px 0;

  .qrcode-image {
    width: 200px;
    height: 200px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  .qrcode-tip {
    margin-top: 15px;
    color: #606266;
    font-size: 14px;
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>

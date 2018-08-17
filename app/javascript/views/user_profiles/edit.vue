<script>
  import CSRF from 'components/shared/csrf.vue';

  var get_data = document.getElementById("information").dataset.userProfile;
  var user_profile = JSON.parse(get_data);

  export default {
    components: {
      csrf: CSRF
    },
    props: {
      errors: Array
    },

    data: function() {
      return ({
        user_profile: user_profile,
        rules: {
          email: [
            {type: 'email', trigger: 'blur,change'}
          ]
        }
      });
    }
  }
</script>

<template>
  <div class="">
    <el-alert v-for="error in errors"
      type="error"
      :title="error"
      :closable="false"
    >
  </el-alert>
  <el-container class="bg-light" style="height: 100vh;">
    <el-main>
      <el-row type="flex" justify="center">
        <el-col :xs="24" :sm="12">
          <el-card class="box-card" style="width: 100%">
            <div slot="header" class="clearfix">
              <h3>User Profile</h3>
            </div>
            <el-form :model="user_profile" :rules="rules" label-position="top" method="post" action="/user_profiles/update">
              <csrf></csrf>

              <el-form-item label="Name" prop="name" required>
                <el-input name="user_profile[name]" v-model="user_profile.name" type="name">
                </el-input>
              </el-form-item>

              <el-form-item label="Surname" prop="surname" required>
                <el-input v-model="user_profile.surname" name="user_profile[surname]" type="surname" autocomplete="off">
                </el-input>
              </el-form-item>

              <el-form-item label="City" prop="city" required>
                <el-input v-model="user_profile.city" name="user_profile[city]" type="city" autocomplete="off">
                </el-input>
              </el-form-item>

                <el-input v-model="user_profile.id" name="user_profile[id]" type="hidden" >
                </el-input>

              <el-form-item>
                <el-button native-type="submit" type="primary" class="m-t-10">
                  Edit
                </el-button>
              </el-form-item>
            </el-form>
          </el-card>
        </el-col>
      </el-row>
    </el-main>
  </el-container>
</div>
</template>

<style scoped>
  .box-card {
    margin-top: 30px;
  }
</style>

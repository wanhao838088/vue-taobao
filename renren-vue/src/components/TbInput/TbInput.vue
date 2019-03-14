<template>
    <div>
      <div class="am-list-control">
        <input @keyup="changePhone" @focus="changePhone" @blur="isShowDelPhone=false" v-model="phone" type="text" class="am-input-required" name="TPL_username" placeholder="手机号/邮箱/会员名" value="" id="username"/>
      </div>
      <!--删除按钮-->
      <div class="am-list-action">
        <i v-show="isShowDelPhone" @click.native="clearPhone" @click="clearPhone" class="am-icon-clear iconfont  icon-shanchuguanbicha"></i>
      </div>
    </div>
</template>

<script>
    export default {
        name: "TbInput"
    }
</script>

<style lang="stylus" rel="stylesheet/stylus" scoped>

</style>

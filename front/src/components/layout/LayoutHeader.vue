<template>
  <header>
    <v-app-bar app>
      <v-toolbar-title>MolkkyRecord</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" app fixed temporary>
      <v-list nav dense>
        <v-list-item-group>
          <v-list-item>
            <v-list-item-title>お知らせ</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>※ユーザー</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>つぶやき</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>スコア投稿</v-list-item-title>
          </v-list-item>
          <v-list-item @click.stop="showModal = true">
            <v-list-item-title>ログアウト</v-list-item-title>
            <v-list-item-action>
              <v-icon>mdi-transfer-right</v-icon>
            </v-list-item-action>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <UserLogout v-if="showModal" @cancel="showModal = false" @ok="logOut">
      <div slot="body">本当にログアウトしますか？</div>
    </UserLogout>
  </header>
</template>

<script>
import axios from "axios";
import UserLogout from "./user/UserLogout.vue";

export default {
  components: { UserLogout },
  data () {
    return {
      drawer: false,
      showModal: false,
    }
  },
  async logOut() {
    await axios
      .delete("/v1/auth/sign_out", {
        headers: {
          "access-token": localStorage.getItem("access-token"),
          uid: localStorage.getItem("uid"),
          client: localStorage.getItem("client"),
        },
      })
      .then(
        (response) => {
          // レスポンスで返ってきた、認証に必要な情報をlocalStorageに保存
          localStorage.setItem(
            "access-token",
            response.headers["access-token"]
          );
          localStorage.setItem("expiry", response.headers.expiry);
          localStorage.setItem("client", response.headers.client);
          localStorage.setItem("uid", response.headers.uid);
          localStorage.setItem("token-type", response.headers["token-type"]);
          return response;
        },
        (error) => {
          return error;
        }
      );
    this.showModal = false;
    this.$router.push({ name: "Login" });
  },
}
</script>
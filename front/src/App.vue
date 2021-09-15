<template>
  <div id="app">
    <v-app>
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
              <v-list-item>
                <v-list-item-title>ログアウト</v-list-item-title>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </v-navigation-drawer>
      </header>
      <div id="nav">
        <router-link to="/">Home</router-link> |
        <router-link to="/about">About</router-link>
      </div>
      <router-view/>
    </v-app>
  </div>
</template>

<script>
export default {
  data () {
    return {
      drawer: false
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>

<template>
  <div>
    <b-table striped hover :items="objOfData"></b-table>
  </div>
</template>
<script>
export default {
  props: ['objOfData']
}
</script>

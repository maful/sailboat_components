export default function (Alpine) {
  Alpine.data("SailboatDismissible", () => ({
    show: true,
    close() {
      if (!this.show) return
      this.show = false
    }
  }))
}

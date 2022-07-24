/// 会话监听
class ConvListener {
  final Function()? onUpdate; // 更新会话

  ConvListener({
    this.onUpdate,
  });

  void update() {
    if (onUpdate != null) onUpdate!();
  }
}

/// 未读数量监听
class UnreadCountListener {
  final Function(int count)? onUnreadCount; // 未读数量

  UnreadCountListener({
    this.onUnreadCount,
  });

  void unreadCount(int count) {
    if (onUnreadCount != null) onUnreadCount!(count);
  }
}
